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

#ifndef UTIL_H
#define UTIL_H

#include <QPointF>
#include <QQmlListProperty>
#include <QRectF>
#include <QTouchEvent>
#include <QVariantList>
#include <algorithm>
#include <cstdlib>
#include "VariantConverter.h"

class QSGTexture;
class QUrl;
class QWindow;

/**
 * @brief Frequently used static utility functions.
 */
namespace Util {

/**
 * @brief Returns @p list converted to a QVariantList.
 * @note @p T must have a valid VariantConverter specialization.
 * @tparam Type for conversion
 * @param list QList to convert
 * @see VariantConverter
 */
template <typename T>
QVariantList toVariantList(const QList<T>& list) {
    QVariantList newList;
    newList.reserve(list.size());
    VariantConverter<T> converter;
    for (const T& item : list) {
        newList.append(converter.toVariant(item));
    }
    return newList;
}

/**
 * @brief Returns @p list converted to a QList.
 * @note @p T must have a valid VariantConverter specialization.
 * @tparam Type for conversion
 * @param list QVariantList to convert
 * @see VariantConverter
 */
template <typename T>
QList<T> toList(const QVariantList& list) {
    QList<T> convertedList;
    convertedList.reserve(list.size());
    VariantConverter<T> converter;
    for (const QVariant& v : list) {
        convertedList.append(converter.fromVariant(v));
    }
    return convertedList;
}

/**
 * @brief Returns @p map converted to a QVariantMap.
 * @note @p T must have a valid VariantConverter specialization.
 * @tparam Type for conversion
 * @param map QMap to convert
 * @see VariantConverter
 */
template <typename T>
QVariantMap toVariantMap(const QMap<QString, T> map) {
    QVariantMap convertedMap;
    VariantConverter<T> converter;
    for (auto it = map.cbegin(); it != map.cend(); ++it) {
        convertedMap.insert(it.key(), converter.toVariant(it.value()));
    }
    return convertedMap;
}

/**
 * @brief Returns @p map converted to a QMap.
 * @note @p T must have a valid VariantConverter specialization.
 * @tparam Type for conversion
 * @param map QVariantMap to convert
 * @see VariantConverter
 */
template <typename T>
QMap<QString, T> toMap(const QVariantMap& map) {
    QMap<QString, T> convertedMap;
    VariantConverter<T> converter;
    for (auto it = map.cbegin(); it != map.cend(); ++it) {
        convertedMap.insert(it.key(), converter.fromVariant(it.value()));
    }
    return convertedMap;
}

/**
 * @brief Helper class which creates QQmlListProperty objects directly on QList members fields.
 *
 * The location of the member field is declared as a template parameter.
 * The location of the change signal is passed as the QQmlListProperty's user data. It may be null.
 *
 * @note QQmlListProperty has a constructor which takes a reference to a QList, but we cannot
 * use it. According to the Qt documentation:
 * "Convenience constructor for making a QQmlListProperty value from an existing QList list. The
 * list reference must remain valid for as long as object exists. object must be provided.
 * Generally this constructor should not be used in production code, as a writable QList
 * violates QML's memory management rules. However, this constructor can very useful while
 * prototyping."
 */
template <typename TObject, typename TData, typename TListType, TListType TObject::* TObjectField,
        void (TObject::* TChangeFunc)() = nullptr>
class QQmlListPropertyOnQList {
public:

    /**
     * @brief Create and return a QQmlListProperty<TData>.
     */
    static QQmlListProperty<TData> createList(TObject* owner) {
        return QQmlListProperty<TData>(
                owner,
                nullptr,
                &QQmlListPropertyOnQList::appendFunc,
                &QQmlListPropertyOnQList::countFunc,
                &QQmlListPropertyOnQList::atFunc,
                &QQmlListPropertyOnQList::clearFunc);
    }

private:
    static void appendFunc(QQmlListProperty<TData>* property, TData* value) {
        TObject* owner = static_cast<TObject*>(property->object);
        TListType& list = (owner->*TObjectField);
        list.append(value);
        callChangeFunc(property);
    }

    static int countFunc(QQmlListProperty<TData>* property) {
        TObject* owner = static_cast<TObject*>(property->object);
        TListType& list = (owner->*TObjectField);
        return list.size();
    }

    static TData* atFunc(QQmlListProperty<TData>* property, int index) {
        TObject* owner = static_cast<TObject*>(property->object);
        TListType& list = (owner->*TObjectField);
        return list.at(index);
    }

    static void clearFunc(QQmlListProperty<TData>* property) {
        TObject* owner = static_cast<TObject*>(property->object);
        TListType& list = (owner->*TObjectField);
        list.clear();
        callChangeFunc(property);
    }

    static void callChangeFunc(QQmlListProperty<TData>* property) {
        TObject* owner = static_cast<TObject*>(property->object);
        if (TChangeFunc) {
            (owner->*TChangeFunc)();
        }
    }
};

/**
 * @brief Returns the value @p a clamped between @p min and @p max.
 * @param a Value to clamp
 * @param min Minimum value to return
 * @param max Maximum value to return
 */
template <typename T>
inline const T& clamp(const T& a, const T& min, const T& max) {
    return std::max<T>(min, std::min<T>(max, a));
}

/**
 * @brief Computes the value of a smoothed interpolation curve between @c 0.0f and @c 1.0f.
 *
 * @note This is a conventional smoothstep curve (see http://en.wikipedia.org/wiki/Smoothstep). It
 * is a fifth order polynomial, with zero first and second order derivatives at the endpoints.
 * @param t Parametric value
 */
static inline float smoothstep(float t) {
    float t2 = t * t;
    float t3 = t * t2;
    float t4 = t2 * t2;
    float t5 = t2 * t3;
    return 6 * t5 - 15 * t4 + 10 * t3;
}

/**
 * @brief Returns a pseudo-random number in the range <tt>[0, 1)</tt>.
 */
static inline float qrandF() {
    return qrand() / ((float) RAND_MAX + 1);
}


/**
 * @brief Returns our closest ancestor which is of type @c TObject.
 * @param node Node to search
 */
template <typename TObject>
TObject* findParentOfType(QObject* node) {
    node = node->parent();
    while (node) {
        TObject* obj = qobject_cast<TObject*>(node);
        if (obj) {
            return obj;
        }
        node = node->parent();
    }
    return nullptr;
}

/**
 * @brief Returns the platform dependent path to @p assetPath.
 * @param assetPath Path of asset to resolve.
 */
QString getPathToAsset(const QString& assetPath);

/**
 * @brief Returns platform dependent path URL to @p assetPath.
 * @param assetPath Path of asset to resolve.
 */
QUrl getUrlPathToAsset(const QString& assetPath);

/**
 * @brief Returns the platform dependent path to the font in @p fontPath.
 * @param fontPath Path of font to resolve
 */
QString getPathToFont(const QString& fontPath);

/**
 * @brief Returns the platform dependent path to the image in @p imagePath.
 * @param imagePath Path of image to resolve
 */
QString getPathToImage(const QString& imagePath);

/**
 * @brief Returns the platform dependent path to the movie in @p moviePath.
 * @param moviePath Path of movie to resolve
 */
QString getPathToMovie(const QString& moviePath);

/**
 * @brief Returns the platform dependent path to the level in @p levelPath.
 * @param levelPath Path of level to resolve
 */
QString getPathToLevel(const QString& levelPath);

/**
 * @brief Returns the platform dependent path to the sound in @p soundPath.
 * @param soundPath Path of sound to resolve
 */
QString getPathToSound(const QString& soundPath);

/**
 * @brief Returns the platform dependent path to the data file in @p dataPath.
 * @param dataPath Path of data file to resolve
 */
QString getPathToData(const QString& dataPath);

/**
 * @brief Returns the entire contents of a text file as a @c QString.
 * @param path Path to file to read
 */
QString readFileAsQString(const QString& path);

/**
 * @brief Returns the entire contents of a text file as a @c std::string
 * @param path Path to file to read
 */
std::string readFileAsStdString(const QString& path);

/**
 * @brief Expands a QRectF's span to include a point.
 *
 * @note This function is needed because QRectF cannot handle unioning an "empty" rectangle.
 *
 * @param rect Rectangle to expand
 * @param point Point by which we expand @p rect
 */
QRectF united(const QRectF& rect, const QPointF& point);

/**
 * @brief Checks if a javascript function exists.
 * @param object Object to check for @p method
 * @param method Name of method to check
 */
bool javaScriptFuncExists(QObject* object, const char* method);

/**
 * @brief Returns @c true if the device on which the game is running has a touch screen.
 */
bool deviceHasTouchScreen();

/**
 * @brief Returns the device id of the touch screen on the device, or -1 if none exists.
 */
int getDeviceTouchScreenDeviceId();

} // namespace Util

#endif // UTIL_H
