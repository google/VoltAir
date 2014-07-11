/*
 * Copyright (C) 2014 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * NOTE: This file was adapted from:
 * https://github.com/playgameservices/android-samples/blob/master/BasicSamples/libraries/
 *   BaseGameUtils/src/main/java/com/google/example/games/basegameutils/GameHelper.java
 */

package com.google.fpl.utils;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender.SendIntentException;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;

// TODO: Remove VoltAir reference in this file.
import com.google.fpl.voltair.R;
import com.google.android.gms.appstate.AppStateManager;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.GamesActivityResultCodes;
import com.google.android.gms.games.multiplayer.Invitation;
import com.google.android.gms.games.multiplayer.Multiplayer;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatch;
import com.google.android.gms.games.request.GameRequest;
import com.google.android.gms.plus.Plus;

import java.util.ArrayList;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @brief Helper class responsible for setting up the @c GoogleApiClient object and managing its
 * lifecycle for activities.
 *
 * Activities should instantiate the class in their @c onCreate() method and specify the requested
 * clients (e.g. <tt>CLIENT_GAMES | CLIENT_APPSTATE</tt>) during setup.  Additionally, those
 * activities should implement the SignInListener interface and register themselves as listeners for
 * changes in sign-in status.
 */
public class GooglePlayServicesHelper implements GoogleApiClient.ConnectionCallbacks,
        GoogleApiClient.OnConnectionFailedListener {
    /**
     * @brief Listener for sign-in success or failure events.
     */
    public interface SignInListener {
        /**
         * @brief Called when sign-in fails.
         *
         * As a result, a "Sign-In" button can be shown to the user; when that button is clicked,
         * call beginUserInitiatedSignIn().
         * @note Not all calls to this method mean an error; it may be a result of the fact that
         * automatic sign-in could not proceed because user interaction was required (e.g. consent
         * dialogs). Thus, implementations of this method should NOT display an error message
         * unless a call to hasSignInError() indicates that an error indeed occurred.
         */
        void onSignInFailed();

        /**
         * @brief Called when sign-in succeeds.
         *
         * As a result, a "Sign Out" button can be shown to the user; when that button is clicked,
         * call signOut().
         */
        void onSignInSucceeded();
    }

    /**
     * @brief Represents the reason for a sign-in failure.
     */
    public static class SignInFailureReason {
        /**
         * @brief Represents no activity result code available.
         */
        public static final int NO_ACTIVITY_RESULT_CODE = -100;

        private int mServiceErrorCode = 0;
        private int mActivityResultCode = NO_ACTIVITY_RESULT_CODE;

        /**
         * @brief Constructs a SignInFailureReason with the given @c GoogleApiClient service error.
         * @param serviceErrorCode GoogleApiClient service error code that caused failure
         */
        public SignInFailureReason(int serviceErrorCode) {
            this(serviceErrorCode, NO_ACTIVITY_RESULT_CODE);
        }

        /**
         * @brief Constructs a SignInFailureReason with the given @c GoogleApiClient service error
         * and activity code.
         * @param serviceErrorCode GoogleApiClient service error code that caused failure
         * @param activityResultCode Result code returned by the @c GoogleApiClient sign-in activity
         */
        public SignInFailureReason(int serviceErrorCode, int activityResultCode) {
            mServiceErrorCode = serviceErrorCode;
            mActivityResultCode = activityResultCode;
        }

        /**
         * @brief Returns the @c GoogleApiClient service error code.
         */
        public int getServiceErrorCode() {
            return mServiceErrorCode;
        }

        /**
         * @brief Returns the @c GoogleApiClient sign-in activity result code.
         */
        public int getActivityResultCode() {
            return mActivityResultCode;
        }

        /**
         * @brief Returns the human-readable representation of this SignInFailureReason.
         */
        @Override
        public String toString() {
            return String.format(
                    "SignInFailureReason(ServiceErrorCode: %s, ActivityResultCode: %s)",
                    errorCodeToString(mServiceErrorCode),
                    mActivityResultCode == NO_ACTIVITY_RESULT_CODE
                        ? "None" : activityResponseCodeToString(mActivityResultCode));
        }
    }

    // Client request flags.
    /**
     * @brief No clients.
     */
    public static final int CLIENT_NONE = 0x00;
    /**
     * @brief Google Play Games client.
     */
    public static final int CLIENT_GAMES = 0x01;
    /**
     * @brief Google Plus client.
     */
    public static final int CLIENT_PLUS = 0x02;
    /**
     * @brief Google AppState client.
     */
    public static final int CLIENT_APPSTATE = 0x04;
    /**
     * @brief All clients supported by GooglePlayServicesHelper.
     */
    public static final int CLIENT_ALL = CLIENT_GAMES | CLIENT_PLUS | CLIENT_APPSTATE;

    private static final String LOG_TAG = GooglePlayServicesHelper.class.toString();
    private static final String GOOGLEPLAYSERVICESHELPER_PREFS = "GOOGLEPLAYSERVICESHELPER_PREFS";
    private static final String SIGN_IN_CANCELLATIONS_KEY = "SIGN_IN_CANCELLATIONS_KEY";

    // Request code we use when invoking other Activities to complete the sign-in flow.
    private static final int RC_RESOLVE = 9001;
    // Request code when invoking Activities whose result we don't care about.
    private static final int RC_UNUSED = 9002;

    // Are we currently connecting?
    private boolean mConnecting = false;
    // Are we expecting the result of a resolution flow?
    private boolean mExpectingResolution = false;
    // Was the sign-in flow canceled when we tried it?
    private boolean mSignInCanceled = false;
    // Were we signed-in previously at some point?
    private boolean mHadPreviouslySuccessfulSignIn = false;

    // The Activity we are bound to. We need to keep a reference to the Activity because some games
    // methods require an Activity (a Context won't do).
    // NOTE: We are careful not to leak this reference, as we release it in onStop().
    private Activity mActivity = null;

    // Api options to use when adding each API, null for none.
    private GoogleApiClient.ApiOptions mAppStateApiOptions = null;
    private GoogleApiClient.ApiOptions mGamesApiOptions = null;
    private GoogleApiClient.ApiOptions mPlusApiOptions = null;

    // Google API client object we manage.
    private GoogleApiClient mGoogleApiClient = null;
    // What clients were requested?
    private int mRequestedClients = CLIENT_NONE;

    // Whether to automatically try to sign in on onStart().
    private boolean mAutoSignIn = true;
    // If we automatically force sign-in flow, how many times in the life of the application?
    private int mMaxForcedSignInAttempts = 2;
    // Whether user has specifically requested that the sign-in process begin. If false, we're in
    // the automatic sign-in attempt that we try once the Activity is started. If true, then the
    // user has already clicked a "Sign-In" button or something similar.
    private boolean mUserInitiatedSignIn = false;

    // The connection result we got from our last attempt to sign-in.
    private ConnectionResult mConnectionResult = null;
    // The error that happened during sign-in.
    private SignInFailureReason mSignInFailureReason = null;

    // Should we show error dialog boxes?
    private boolean mShowErrorDialogs = true;

    // Handler to post messages for handling later when in "onStart" or "onStop".
    private Handler mHandler = null;

    // The invitation we got when we connected to the games client, or null if none.
    private Invitation mInvitation = null;
    // The turn-based match we got when we connected to the games client, or null if none.
    private TurnBasedMatch mTurnBasedMatch = null;
    // The game requests we got when we connected to the games client, or null if none.
    private ArrayList<GameRequest> mRequests = null;

    // Listener for sign-in failure or success events.
    private SignInListener mListener = null;

    /**
     * @brief Constructs a GooglePlayServicesHelper, initially tied to @p activity.
     * @note After constructing this object, call setup() from the @c onCreate() method of
     * @p activity.
     * @param activity Activity context to be used for the wrapped @c GoogleApiClient
     * @param clientsToUse Flags indicating which clients are requested
     */
    public GooglePlayServicesHelper(Activity activity, int clientsToUse) {
        mActivity = activity;
        mRequestedClients = clientsToUse;
        mHandler = new Handler();
    }

    /**
     * @brief Sets whether or not the configuration should begin connecting automatically to the
     * GoogleApiClient in onStart().
     *
     * Auto sign-in occurs by default, so this method is used to disable auto sign-in.
     * @note This method is not recommended for general use, but rather only when using this helper
     * class in a non-standard sign-in flow.
     * @param autoSignIn @c true to automatically connect to @c GoogleApiClient in onStart()
     */
    public void setAutoSignIn(boolean autoSignIn) {
        mAutoSignIn = autoSignIn;
    }

    /**
     * @brief Returns the maximum number of times to automatically force sign-in flow on the user.
     *
     * If a sign-in error occurred (e.g. user has not given permissions for sign-in), resolution
     * (e.g. launching sign-in flow) will be forced up until getMaxForcedSignInFlowAttempts() times.
     * @note Only explicitly user cancellations (and not other failures) will count against this
     * maximum. Successful sign-ins will reset the recorded number of failed sign-in attempts.
     */
    public int getMaxForcedSignInAttempts() {
        return mMaxForcedSignInAttempts;
    }

    /**
     * @brief Sets the maximum number of times to automatically force sign-in flow on the user.
     *
     * If set to 0, the user will not be forced through the sign-in flow automatically.
     * @note Only explicitly user cancellations (and not other failures) will count against this
     * maximum. Successful sign-ins will reset the recorded number of failed sign-in attempts.
     */
    public void setMaxForcedSignInAttempts(int max) {
        mMaxForcedSignInAttempts = Math.max(max, 0);
    }

    /**
     * @brief Returns whether or not the configuration will force sign in flow.
     *
     * This is determined by two factors: having auto sign-in enabled and having not exceeded the
     * maximum number of forced sign-in attempts.
     */
    public boolean willForceSignInFlow() {
        return mAutoSignIn && (getSignInUserCancellations() < mMaxForcedSignInAttempts);
    }

    /**
     * @brief Returns the number of times the user has canceled the sign-in flow in the life of the
     * application.
     * @note This count resets after a successful sign-in.
     */
    public int getSignInUserCancellations() {
        if (mActivity == null) {
            return 0;
        }

        SharedPreferences sp = mActivity.getApplicationContext().getSharedPreferences(
                GOOGLEPLAYSERVICESHELPER_PREFS, Context.MODE_PRIVATE);
        return sp.getInt(SIGN_IN_CANCELLATIONS_KEY, 0);
    }

    /**
     * @brief Resets the counter of how many times the user has canceled the sign-in.
     */
    public void resetSignInUserCancellations() {
        setSignInUserCancellations(0);
    }

    /**
     * @brief Sets whether or not to show error dialogs.
     * @param show @c true to show error dialogs
     */
    public void setShowErrorDialogs(boolean show) {
        mShowErrorDialogs = show;
    }

    /**
     * @brief Sets the options to pass when setting up the Games API client.
     * @note This method must be called before setup().
     */
    public void setGamesApiOptions(GoogleApiClient.ApiOptions options) {
        if (mGoogleApiClient != null) {
            throw new IllegalStateException("Cannot set ApiOptions after \"setup()\".");
        }
        mGamesApiOptions = options;
    }

    /**
     * @brief Sets the options to pass when setting up the AppState API client.
     * @note This function must be called before setup().
     */
    public void setAppStateApiOptions(GoogleApiClient.ApiOptions options) {
        if (mGoogleApiClient != null) {
            throw new IllegalStateException("Cannot set ApiOptions after \"setup()\".");
        }
        mAppStateApiOptions = options;
    }

    /**
     * @brief Sets the options to pass when setting up the Plus API client.
     * @note This function must be called before setup().
     */
    public void setPlusApiOptions(GoogleApiClient.ApiOptions options) {
        if (mGoogleApiClient != null) {
            throw new IllegalStateException("Cannot set ApiOptions after \"setup()\".");
        }
        mPlusApiOptions = options;
    }

    /**
     * @brief Returns the GoogleApiClient object.
     * @note This function can only be called after having called setup().
     */
    public GoogleApiClient getApiClient() {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("No GoogleApiClient. Call \"setup()\" first.");
        }
        return mGoogleApiClient;
    }

    /**
     * @brief Returns whether or not the user (i.e. the @c GoogleApiClient) is signed in.
     */
    public boolean isSignedIn() {
        return mGoogleApiClient != null && mGoogleApiClient.isConnected();
    }

    /**
     * @brief Returns whether or not the @c GoogleApiClient is currently connecting.
     */
    public boolean isConnecting() {
        return mConnecting;
    }

    /**
     * @brief Returns whether or not there was a (non-recoverable) error during the sign-in process.
     */
    public boolean hasSignInError() {
        return mSignInFailureReason != null;
    }

    /**
     * @brief Returns the error that happened during the sign-in process, null if no error occurred.
     */
    public SignInFailureReason getSignInError() {
        return mSignInFailureReason;
    }

    /**
     * @brief Returns whether or not an invitation was in the connection bundle.
     */
    public boolean hasInvitation() {
        return mInvitation != null;
    }

    /**
     * @brief Returns the invitation received in the connection bundle, or @c null if no invitation
     * exists.
     * @note This is probably best used in the SignInListener#onSignInSucceeded method to handle
     * an available invitation, after which clearInvitation() should be called.
     */
    public Invitation getInvitation() {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("\"setup\" must have been called first.");
        } else if (!mGoogleApiClient.isConnected()) {
            Log.w(LOG_TAG, "\"getInvitation\" should only be called when signed in.");
        }
        return mInvitation;
    }

    /**
     * @brief Clears the invitation (if any) received in the connection bundle.
     * @note This method should be called after handling the invitation.
     */
    public void clearInvitation() {
        mInvitation = null;
    }

    /**
     * @brief Returns whether or not a turn-based match was received in the connection bundle.
     */
    public boolean hasTurnBasedMatch() {
        return mTurnBasedMatch != null;
    }

    /**
     * @brief Returns the turn-based match received in the connection bundle, or @c null if no
     * turn-based match exists.
     * @note This is probably best used in the SignInListener#onSignInSucceeded method to handle
     * an available turn-based match, after which clearTurnBasedMatch() should be called.
     */
    public TurnBasedMatch getTurnBasedMatch() {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("\"setup\" must have been called first.");
        } else if (!mGoogleApiClient.isConnected()) {
            Log.w(LOG_TAG, "\"getTurnBasedMatch\" should only be called when signed in.");
        }
        return mTurnBasedMatch;
    }

    /**
     * @brief Clears the turn-based match (if any) received in the connection bundle.
     * @note This method should be called after handling the turn-based match.
     */
    public void clearTurnBasedMatch() {
        mTurnBasedMatch = null;
    }

    /**
     * @brief Returns whether or not a list of game requests was received in the connection bundle.
     */
    public boolean hasRequests() {
        return mRequests != null;
    }

    /**
     * @brief Returns the list of game requests received in the connection bundle, or @c null if no
     * requests exist.
     * @note This is probably best used in the SignInListener#onSignInSucceeded method to handle
     * an available list of game requests, after which clearRequests() should be called.
     */
    public ArrayList<GameRequest> getRequests() {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("\"setup\" must have been called first.");
        } else if (!mGoogleApiClient.isConnected()) {
            Log.w(LOG_TAG, "\"getRequests\" should only be called when signed in.");
        }
        return mRequests;
    }

    /**
     * @brief Clears the list of game requests (if any) received in the connection bundle.
     * @note This method should be called after handling the list of game requests.
     */
    public void clearRequests() {
        mRequests = null;
    }

    /**
     * @brief Performs setup on this GooglePlayServicesHelper.
     *
     * Calling of this method will lead to the creation of the @c GoogleApiClient.
     * @note This method should be called from the @c onCreate() method of the calling activity to
     * ensure setup before onStart().
     * @note Custom setup is possible by extending this method to receive additional apis / scopes
     * (e.g. YouTube and Google Maps) for use in building the @c GoogleApiClient.
     * @param listener SignInListener to be notified of sign-in events
     */
    public void setup(SignInListener listener) {
        if (mGoogleApiClient != null) {
            throw new IllegalStateException("\"setup()\" called more than once!");
        }

        mListener = listener;

        GoogleApiClient.Builder builder = new GoogleApiClient.Builder(mActivity, this, this);

        if ((mRequestedClients & CLIENT_GAMES) != 0) {
            builder.addApi(Games.API, mGamesApiOptions);
            builder.addScope(Games.SCOPE_GAMES);
        }

        if ((mRequestedClients & CLIENT_PLUS) != 0) {
            builder.addApi(Plus.API, mPlusApiOptions);
            builder.addScope(Plus.SCOPE_PLUS_LOGIN);
        }

        if ((mRequestedClients & CLIENT_APPSTATE) != 0) {
            builder.addApi(AppStateManager.API, mAppStateApiOptions);
            builder.addScope(AppStateManager.SCOPE_APP_STATE);
        }

        mGoogleApiClient = builder.build();
    }

    /**
     * @brief Starts a user-initiated sign-in flow.
     *
     * As a result of calling this method, authentication / consent dialogs may be displayed. At the
     * end of the process, the registered SignInListener's methods will be called to indicate
     * success or failure.
     * @note As a side effect of invocation, all previous user cancellations are discarded.
     */
    public void beginUserInitiatedSignIn() {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("\"setup\" must have been called first.");
        } else if (mActivity == null) {
            // While an activity context is not explicitly necessary all the time, we make it a
            // pre-requisite for consistency as there is no way to know in advance whether or not
            // we will need to launch a Ui sign in flow that would fail later.
            throw new IllegalStateException("Lacking an activity context from \"onStart\".");
        }

        resetSignInUserCancellations();

        mSignInCanceled = false;
        mAutoSignIn = true;

        if (mGoogleApiClient.isConnected()) {
            Log.w(LOG_TAG, "\"beginUserInitiatedSignIn\" called when already connected.");
            notifySignInListener(true);
            return;
        } else if (mConnecting) {
            Log.w(LOG_TAG, "\"beginUserInitiatedSignIn\" called when already connecting. "
                    + "Be patient! You should only call this method after you get an "
                    + "onSignInSucceeded() or onSignInFailed() callback.");
            // Ignore call (listener will get a callback when the connection process finishes).
            return;
        }

        // Indicate that user is actively trying to sign in (so we know how we should try to resolve
        // connection problems).
        mUserInitiatedSignIn = true;
        mConnecting = true;

        if (mConnectionResult != null) {
            // We have a pending connection result from a previous failure, so start with that.
            resolveConnectionResult();
        } else {
            // We don't have a pending connection result, so start anew.
            mGoogleApiClient.connect();
        }
    }

    /**
     * @brief Sign out and disconnect from the API clients used in the @c GoogleApiClient.
     */
    public void signOut() {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("\"setup\" must have been called first.");
        }

        if (!mGoogleApiClient.isConnected()) {
            return;
        }

        // For Plus, "signing out" means clearing the default account.
        if ((mRequestedClients & CLIENT_PLUS) != 0) {
            Plus.AccountApi.clearDefaultAccount(mGoogleApiClient);
        }

        if ((mRequestedClients & CLIENT_GAMES) != 0) {
            Games.signOut(mGoogleApiClient);
        }

        if ((mRequestedClients & CLIENT_APPSTATE) != 0) {
            AppStateManager.signOut(mGoogleApiClient);
        }

        // Ready to disconnect.
        mAutoSignIn = false;
        mConnecting = false;
        mGoogleApiClient.disconnect();
        notifySignInListener(false);
    }

    /**
     * @brief Disconnects the @c GoogleApiClient client, then connects again.
     */
    public void reconnect() {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("\"setup\" must have been called first.");
        } else if (mActivity == null) {
            throw new IllegalStateException("Lacking an activity context from \"onStart\".");
        } else if (!mGoogleApiClient.isConnected()) {
            Log.w(LOG_TAG, "\"reconnect\" called when client is not connected.");
            // Interpret reconnect as a request to connect.
            mGoogleApiClient.connect();
        } else {
            mGoogleApiClient.reconnect();
        }
    }

    /**
     * @brief Notifies this GooglePlayServicesHelper of the @c onStart activity lifecycle event.
     *
     * This method should be called from the @c onStart method in @p activity.
     * @param activity Activity context to be used for the wrapped @c GoogleApiClient
     */
    public void onStart(Activity activity) {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("\"setup\" must have been called first.");
        }

        mActivity = activity;

        if (mAutoSignIn) {
            if (!mGoogleApiClient.isConnected() && !mConnecting) {
                mConnecting = true;
                mGoogleApiClient.connect();
            }
        } else {
            Log.i(LOG_TAG, "Skipping connect because auto sign-in is disabled.");
            mHandler.post(new Runnable() {
                @Override
                public void run() {
                    notifySignInListener(false);
                }
            });
        }
    }

    /**
     * @brief Notifies this GooglePlayServicesHelper of the @c onStop activity lifecycle event.
     *
     * This method should be called from the @c onStop method in the activity context used to create
     * this GooglePlayServicesHelper.
     */
    public void onStop() {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("\"setup\" must have been called first.");
        } else if (mActivity == null) {
            throw new IllegalStateException("\"onStop\" called out of order of \"onStart\"");
        } else if (mGoogleApiClient.isConnected()) {
            mGoogleApiClient.disconnect();
        }

        mConnecting = false;
        mExpectingResolution = false;

        // Let go of the Activity reference to avoid leaking it.
        mActivity = null;
    }

    /**
     * @brief Notifies this GooglePlayServicesHelper of the @c onActivityResult event.
     *
     * This method should be called from the @c onActivityResult method in the activity context used
     * to create this GooglePlayServicesHelper. If the activity result pertains to the sign-in
     * process, then it is processesed appropriately, otherwise it is ignored.
     * @param requestCode Identifier supplied when the activity was originally launched that is used
     * to identify if this result pertains to the sign-in process
     * @param responseCode Status returned by the activity
     * @param data Intent which can be used to return result data to the caller
     */
    public void onActivityResult(int requestCode, int responseCode, Intent data) {
        if (mGoogleApiClient == null) {
            throw new IllegalStateException("\"setup\" must have been called first.");
        }

        if (requestCode != RC_RESOLVE) {
            // Request code not meant for us, ignoring.
            return;
        }

        // No longer expecting a resolution.
        mExpectingResolution = false;

        if (!mConnecting) {
            // Ignoring because we are no longer connecting.
            return;
        }

        // We're returning back from an activity that was launched to resolve a connection problem.
        // For example, the sign-in flow UI that spawns permissions dialogs, etc.
        if (responseCode == Activity.RESULT_OK) {
            // Ready to try to connect again.
            mGoogleApiClient.connect();
        } else if (responseCode == GamesActivityResultCodes.RESULT_RECONNECT_REQUIRED) {
            // Try to "reconnect".
            mGoogleApiClient.connect();
        } else if (responseCode == Activity.RESULT_CANCELED) {
            // User canceled.
            mSignInCanceled = true;
            mAutoSignIn = false;
            mUserInitiatedSignIn = false;
            mSignInFailureReason = null; // Cancelling is not a failure!
            mConnecting = false;
            mGoogleApiClient.disconnect();

            // Increment # of cancellations.
            setSignInUserCancellations(getSignInUserCancellations() + 1);
            notifySignInListener(false);
        } else {
            // Whatever the problem we were trying to solve, it was not solved.
            // So give up and show an error message.
            giveUp(new SignInFailureReason(mConnectionResult.getErrorCode(), responseCode));
        }
    }

    /**
     * @brief Called when a connection to the @c GoogleApiClient is successfully obtained.
     * @param connectionHint Bundle of data provided to clients by Google Play Games Services, or
     * @c null if no content is provided by the service
     */
    @Override
    public void onConnected(Bundle connectionHint) {
        mSignInFailureReason = null;
        mAutoSignIn = true;
        mUserInitiatedSignIn = false;
        mConnecting = false;
        mHadPreviouslySuccessfulSignIn = true;

        if (connectionHint != null) {
            // Retrieve and cache the invitation.
            mInvitation = connectionHint.getParcelable(Multiplayer.EXTRA_INVITATION);

            // Do we have any requests pending?
            mRequests = Games.Requests.getGameRequestsFromBundle(connectionHint);
            if (mRequests.isEmpty()) {
                // Make our API consistent where no object is null for no requests.
                mRequests = null;
            }

            mTurnBasedMatch = connectionHint.getParcelable(Multiplayer.EXTRA_TURN_BASED_MATCH);
        } else {
            mInvitation = null;
            mRequests = null;
            mTurnBasedMatch = null;
        }

        notifySignInListener(true);
    }

    /**
     * @brief Called when a connection attempt to the @c GoogleApiClient fails.
     * @param result @c ConnectionResult that can be used for resolving the sign-in error and / or
     * deciding what sort of error occurred
     */
    @Override
    public void onConnectionFailed(ConnectionResult result) {
        // Save connection result for later reference.
        mConnectionResult = result;

        Log.i(LOG_TAG, "Connection failure:");
        Log.i(LOG_TAG, "   - code: " + errorCodeToString(mConnectionResult.getErrorCode()));
        Log.i(LOG_TAG, "   - resolvable: " + mConnectionResult.hasResolution());
        Log.i(LOG_TAG, "   - details: " + mConnectionResult.toString());

        boolean shouldResolve;
        if (mUserInitiatedSignIn) {
            Log.i(LOG_TAG, "Since user initiated sign-in, resolving problem.");
            shouldResolve = true;
        } else if (mHadPreviouslySuccessfulSignIn
                && mConnectionResult.getErrorCode() == ConnectionResult.SIGN_IN_REQUIRED) {
            // The user was signed in previously, this must mean that they signed out through
            // a mechanism we are unaware of (e.g. GPGS Settings).
            Log.i(LOG_TAG, "Since user already signed-in once, will not resolve problem.");
            shouldResolve = false;
        } else if (mSignInCanceled) {
            Log.i(LOG_TAG, "Since user already canceled once, will not resolve problem.");
            shouldResolve = false;
        } else if (willForceSignInFlow()) {
            Log.i(LOG_TAG, "Since we are forcing sign-in flow, resolving problem.");
            shouldResolve = true;
        } else {
            Log.w(LOG_TAG, "Since user didn't initiate sign-in, and we are not forcing sign-in "
                    + "flow, will not resolve problem.");
            shouldResolve = false;
        }

        if (!shouldResolve) {
            // Fail and wait for the user to want to sign in.
            mConnecting = false;
            notifySignInListener(false);
            return;
        } else {
            resolveConnectionResult();
        }
    }

    /**
     * @brief Called when a connection attempt to the @c GoogleApiClient is suspended due to
     * falling into a temporarily disconnected state.
     * @param cause Code that identifies the reason for the disconnection
     */
    @Override
    public void onConnectionSuspended(int cause) {
        if (mGoogleApiClient.isConnected()) {
            mGoogleApiClient.disconnect();
        }
        mSignInFailureReason = null;
        mConnecting = false;
        notifySignInListener(false);
    }

    // ----------------------------------------------------------------------------------------

    private static String errorCodeToString(int errorCode) {
        String error;
        switch (errorCode) {
        case ConnectionResult.DEVELOPER_ERROR:
            error = "DEVELOPER_ERROR"; break;
        case ConnectionResult.INTERNAL_ERROR:
            error = "INTERNAL_ERROR"; break;
        case ConnectionResult.INVALID_ACCOUNT:
            error = "INVALID_ACCOUNT"; break;
        case ConnectionResult.LICENSE_CHECK_FAILED:
            error = "LICENSE_CHECK_FAILED"; break;
        case ConnectionResult.NETWORK_ERROR:
            error = "NETWORK_ERROR"; break;
        case ConnectionResult.RESOLUTION_REQUIRED:
            error = "RESOLUTION_REQUIRED"; break;
        case ConnectionResult.SERVICE_DISABLED:
            error = "SERVICE_DISABLED"; break;
        case ConnectionResult.SERVICE_INVALID:
            error = "SERVICE_INVALID"; break;
        case ConnectionResult.SERVICE_MISSING:
            error = "SERVICE_MISSING"; break;
        case ConnectionResult.SERVICE_VERSION_UPDATE_REQUIRED:
            error = "SERVICE_VERSION_UPDATE_REQUIRED"; break;
        case ConnectionResult.SIGN_IN_REQUIRED:
            error = "SIGN_IN_REQUIRED"; break;
        case ConnectionResult.SUCCESS:
            error = "SUCCESS"; break;
        default:
            error = "UNKNOWN"; break;
        }
        return String.format("%s(%d)", error, errorCode);
    }

    private static String activityResponseCodeToString(int respCode) {
        switch (respCode) {
        case Activity.RESULT_OK:
            return "RESULT_OK";
        case Activity.RESULT_CANCELED:
            return "RESULT_CANCELED";
        case GamesActivityResultCodes.RESULT_APP_MISCONFIGURED:
            return "RESULT_APP_MISCONFIGURED";
        case GamesActivityResultCodes.RESULT_LEFT_ROOM:
            return "RESULT_LEFT_ROOM";
        case GamesActivityResultCodes.RESULT_LICENSE_FAILED:
            return "RESULT_LICENSE_FAILED";
        case GamesActivityResultCodes.RESULT_RECONNECT_REQUIRED:
            return "RESULT_RECONNECT_REQUIRED";
        case GamesActivityResultCodes.RESULT_SIGN_IN_FAILED:
            return "RESULT_SIGN_IN_FAILED";
        case SignInFailureReason.NO_ACTIVITY_RESULT_CODE:
            return "NO_RESULT";
        default:
            return String.valueOf(respCode);
        }
    }

    private static void printMisconfiguredDebugInfo(Context ctx) {
        Log.w(LOG_TAG, "****");
        Log.w(LOG_TAG, "****");
        Log.w(LOG_TAG, "**** APP NOT CORRECTLY CONFIGURED TO USE GOOGLE PLAY GAME SERVICES");
        Log.w(LOG_TAG, "**** This is usually caused by one of these reasons:");
        Log.w(LOG_TAG, "**** (1) Your package name and certificate fingerprint do not match");
        Log.w(LOG_TAG, "****     the client ID you registered in Developer Console.");
        Log.w(LOG_TAG, "**** (2) Your App ID was incorrectly entered.");
        Log.w(LOG_TAG, "**** (3) Your game settings have not been published and you are ");
        Log.w(LOG_TAG, "****     trying to log in with an account that is not listed as");
        Log.w(LOG_TAG, "****     a test account.");
        Log.w(LOG_TAG, "****");

        if (ctx == null) {
            Log.w(LOG_TAG, "**** (no Context, so can't print more debug info)");
            return;
        }

        Log.w(LOG_TAG, "**** To help you debug, here is the information about this app");
        Log.w(LOG_TAG, "**** Package name         : " + ctx.getPackageName());
        Log.w(LOG_TAG, "**** Cert SHA1 fingerprint: " + getSHA1CertFingerprint(ctx));
        Log.w(LOG_TAG, "**** App ID from          : " + getAppIdFromResource(ctx));
        Log.w(LOG_TAG, "****");
        Log.w(LOG_TAG, "**** Check that the above information matches your setup in ");
        Log.w(LOG_TAG, "**** Developer Console. Also, check that you're logging in with the");
        Log.w(LOG_TAG, "**** right account (it should be listed in the Testers section if");
        Log.w(LOG_TAG, "**** your project is not yet published).");
        Log.w(LOG_TAG, "****");
        Log.w(LOG_TAG, "**** For more information, refer to the troubleshooting guide:");
        Log.w(LOG_TAG, "**** http://developers.google.com/games/services/android/troubleshooting");
    }

    private static String getAppIdFromResource(Context ctx) {
        try {
            Resources res = ctx.getResources();
            String pkgName = ctx.getPackageName();
            int res_id = res.getIdentifier("app_id", "string", pkgName);
            return res.getString(res_id);
        } catch (Exception ex) {
            Log.e(LOG_TAG, ex.getMessage());
            return "??? (failed to retrieve APP ID)";
        }
    }

    private static String getSHA1CertFingerprint(Context ctx) {
        try {
            Signature[] sigs = ctx.getPackageManager().getPackageInfo(ctx.getPackageName(),
                    PackageManager.GET_SIGNATURES).signatures;
            if (sigs.length == 0) {
                return "ERROR: NO SIGNATURE.";
            } else if (sigs.length > 1) {
                return "ERROR: MULTIPLE SIGNATURES.";
            }
            byte[] digest = MessageDigest.getInstance("SHA1").digest(sigs[0].toByteArray());
            StringBuilder hexString = new StringBuilder();
            for (int i = 0; i < digest.length; ++i) {
                if (i > 0) {
                    hexString.append(":");
                }
                byteToString(hexString, digest[i]);
            }
            return hexString.toString();
        } catch (PackageManager.NameNotFoundException ex) {
            Log.e(LOG_TAG, ex.getMessage());
            return "ERROR: PACKAGE NOT FOUND.";
        } catch (NoSuchAlgorithmException ex) {
            Log.e(LOG_TAG, ex.getMessage());
            return "ERROR: SHA1 ALGORITHM NOT FOUND.";
        }
    }

    private static void byteToString(StringBuilder sb, byte b) {
        int unsigned_byte = b < 0 ? b + 256 : b;
        int hi = unsigned_byte / 16;
        int lo = unsigned_byte % 16;
        sb.append("0123456789ABCDEF".substring(hi, hi + 1));
        sb.append("0123456789ABCDEF".substring(lo, lo + 1));
    }

    /**
     * Shows an error dialog that's appropriate for the failure reason.
     */
    private static void showFailureDialog(Activity activity, SignInFailureReason reason) {
        if (activity == null) {
            Log.e(LOG_TAG, "*** No activity context. Can't show failure dialog!");
            return;
        } else if (reason == null) {
            Log.w(LOG_TAG, "*** No SignInFailureReason for which to show dialog.");
            return;
        }

        int errorCode = reason.getServiceErrorCode();
        int actResp = reason.getActivityResultCode();

        Dialog errorDialog = null;

        switch (actResp) {
        case GamesActivityResultCodes.RESULT_APP_MISCONFIGURED:
            errorDialog = makeSimpleDialog(activity, activity.getString(
                    R.string.googleplayserviceshelper_app_misconfigured));
            break;
        case GamesActivityResultCodes.RESULT_SIGN_IN_FAILED:
            errorDialog = makeSimpleDialog(activity, activity.getString(
                    R.string.googleplayserviceshelper_sign_in_failed));
            break;
        case GamesActivityResultCodes.RESULT_LICENSE_FAILED:
            errorDialog = makeSimpleDialog(activity, activity.getString(
                    R.string.googleplayserviceshelper_license_failed));
            break;
        default:
            // No meaningful response code, so generate default Google Play services dialog.
            errorDialog = GooglePlayServicesUtil.getErrorDialog(errorCode, activity, RC_UNUSED);
        }

        errorDialog.show();
    }

    private static Dialog makeSimpleDialog(Context context, String text) {
        return (new AlertDialog.Builder(context))
                .setMessage(text)
                .setNeutralButton(android.R.string.ok, null)
                .create();
    }

    // ----------------------------------------------------------------------------------------

    /**
     * Sets the counter that indicates how many times the user has canceled the sign in
     * flow in the life of the application.
     */
    private void setSignInUserCancellations(int cancellations) {
        if (mActivity == null) {
            throw new IllegalStateException("Cannot setSignInUserCancellations without a context.");
        }

        SharedPreferences.Editor editor = mActivity.getApplicationContext().getSharedPreferences(
                GOOGLEPLAYSERVICESHELPER_PREFS, Context.MODE_PRIVATE).edit();
        editor.putInt(SIGN_IN_CANCELLATIONS_KEY, cancellations);
        editor.commit();
    }

    /**
     * Give up on signing in due to an error. Shows the appropriate error message to the user,
     * using a standard error dialog as appropriate to the cause of the error. That dialog will
     * indicate to the user how the problem can be solved (for example, re-enable Google Play
     * Services, upgrade to a new version, etc).
     */
     private void giveUp(SignInFailureReason reason) {
         mAutoSignIn = false;
         if (mGoogleApiClient.isConnected()) {
             mGoogleApiClient.disconnect();
         }

         mSignInFailureReason = reason;

         if (reason.mActivityResultCode == GamesActivityResultCodes.RESULT_APP_MISCONFIGURED) {
             // Print debug info for the developer.
             printMisconfiguredDebugInfo(mActivity.getApplicationContext());
         }

         showFailureDialog(mActivity, mSignInFailureReason);
         mConnecting = false;
         notifySignInListener(false);
     }

     private void notifySignInListener(boolean success) {
         if (mListener != null) {
             if (success) {
                 mListener.onSignInSucceeded();
             } else {
                 mListener.onSignInFailed();
             }
         }
     }

     /**
      * Attempts to resolve a connection failure. This will usually involve starting a UI flow that
      * lets the user give the appropriate consents necessary for sign-in to work.
      */
     private void resolveConnectionResult() {
         if (mActivity == null) {
             throw new IllegalStateException("\"onStop\" called out of order of \"onStart\"");
         }

         // Try to resolve the problem
         if (mExpectingResolution) {
             Log.w(LOG_TAG, "We're already expecting the result of a previous resolution.");
             return;
         }

         if (mConnectionResult.hasResolution()) {
             // This problem can be fixed. So let's try to fix it.
             try {
                 // Launch the appropriate UI flow (e.g. the sign-in flow).
                 mExpectingResolution = true;
                 mConnectionResult.startResolutionForResult(mActivity, RC_RESOLVE);
             } catch (SendIntentException e) {
                 // Try connecting again.
                 mExpectingResolution = false;
                 Log.e(LOG_TAG, String.format("SendIntentException: %s, so connecting again.",
                        e.getMessage()));
                 mGoogleApiClient.connect();
             }
         } else {
             // It's not a problem what we can solve, so give up and show an error.
             Log.e(LOG_TAG, "Result has no resolution, must give up.");
             giveUp(new SignInFailureReason(mConnectionResult.getErrorCode()));
         }
     }
}
