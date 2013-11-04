#!/usr/bin/python
#
# Copyright (C) 2014 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Builds a VoltAir.apk, currently in "Release" mode."""
import argparse
import os
import shutil
import subprocess
import sys


class RunProcessError(Exception):
  """Raised when a process returns an error code.

  Attributes:
    process_str: process run, as a string.
    return_code: Non-zero status code returned by a process.
  """

  def __init__(self, process_str, return_code):
    """Constructor for RunProcessError."""

    Exception.__init__(self)
    self.process_str = process_str
    self.return_code = return_code

  def __str__(self):
    fmtstr = "Failed subprocess (returned: %d, CWD: %s): %s"
    return fmtstr % (self.return_code, os.getcwd(), self.process_str)


def RunSubprocess(argv, rundir=None):
  """Runs a process, printing important info, such as the command.

  Args:
    argv: list of arguments to process. Zeroeth arg is process to run.
    rundir: (optional) Directory in which to run the process.

  Raises:
      RunProcessError: If the subprocess returns fails
  """

  try:
    if rundir is not None:
      Pushd(rundir)
    joined_argv = " ".join(argv)
    print >> sys.stderr, "Running subprocess: %s" % joined_argv
    process = subprocess.Popen(argv)
    process.wait()
    print >> sys.stderr, "Subprocess succeeded."
  finally:
    if rundir is not None:
      Popd()
    if process.returncode:
      raise RunProcessError(joined_argv, process.returncode)


def SetEnvironment(sdk_root, ndk_root, ndk_platform):
  """Set up the environment variables we need to run the various commands.

  Args:
    sdk_root: Android SDK location
    ndk_root: Android NDK location
    ndk_platform: Android platform (e.g. android-18)
  """
  os.environ["ANDROID_NDK_PLATFORM"] = ndk_platform
  os.environ["ANDROID_HOME"] = sdk_root
  os.environ["ANDROID_SDK_ROOT"] = sdk_root
  os.environ["ANDROID_NDK_ROOT"] = ndk_root

_dirstack = []


def Pushd(directory):
  """Pushes directory onto a stack.

  Args:
    directory: directory to push
  """
  _dirstack.append(directory)
  os.chdir(directory)


def Popd():
  """Pops and returns the top of the directory stack.
  """
  os.chdir(_dirstack.pop())


def RunLiquidFunNdkBuild(cwd, ndk_root):
  """Builds the liquidfun module.

  Args:
    cwd: working directory in which to run build.
    ndk_root: Android NDK location
  """

  RunSubprocess([ndk_root + "/ndk-build", "V=1"], cwd)


def RunQmake(qt_root, voltair_root):
  """Run the 'qmake' command.

  Args:
    qt_root: Qt framework location
    voltair_root: VoltAir project location.
  """
  qmake = [
      qt_root + "/android_armv7/bin/qmake",
      voltair_root + "/VoltAir/VoltAir.pro",
      "-r",
      "-spec",
      "android-g++"
  ]
  RunSubprocess(qmake)


def RunMake(num_processes):
  """Run the 'make' command.

  Args:
    num_processes: How many processes to use to run 'make' command
  """
  RunSubprocess(["make", "-j", num_processes])


def RunMakeInstall():
  """Run the 'make install' command."""
  RunSubprocess(["make",
                 "install", "INSTALL_ROOT=%s/android-build" % os.getcwd()])


def RunAndroidDeployQt(qt_root, voltair_root, build_dir, ant, ndk_platform,
                       jdk):
  """Run the 'androiddeployqt' command.

  Args:
    qt_root: Qt framework location
    voltair_root: VoltAir project location.
    build_dir: Directory in which app was built. Need to run command here.
    ant: And location
    ndk_platform: Android platform (e.g. android-18)
    jdk: Java Development Kit location
  """
  androiddeployqt = [
      qt_root + "/android_armv7/bin/androiddeployqt",
      "--input",
      os.getcwd() + "/android-libVoltAir.so-deployment-settings.json",
      "--output",
      os.getcwd() + "/android-build",
      "--deployment",
      "bundled",
      "--ant",
      ant,
      "--release",
      "--android-platform",
      ndk_platform,
      "--jdk",
      jdk,
      "--sign",
      voltair_root + "/VoltAir/voltair.keystore",
      "voltair_key",
      "--storepass",
      "voltair",
      "--verbose"
  ]
  RunSubprocess(androiddeployqt, build_dir)


def RenameApk(dst_apk):
  """Run the 'mv' command which moves the APK to a more reasonable name.

  Args:
    dst_apk: name of destination apk
  """

  src_apk = os.getcwd() + "/android-build/bin/QtApp-release.apk"
  print >> sys.stderr, "Renaming %s to %s" % (src_apk, dst_apk)
  os.rename(src_apk, dst_apk)


def RemoveBuildDir(build_dir):
  """Remove the entire build directory.

  Args:
    build_dir: Directory in which app was built. Need to run command here.
  """

  shutil.rmtree(build_dir)


def main():
  parser = argparse.ArgumentParser(description="Build VoltAir.apk")
  parser.add_argument("--build-dir", required=True,
                      help="directory in which to build")
  parser.add_argument("--voltair-root", default=".",
                      help="Location of VoltAir source code")
  parser.add_argument("--liquidfun-root", required=True,
                      help="directory in which liquidfun is located")
  parser.add_argument("--qt-root", required=True, help="Dir for Qt (>= Qt 5.3)")
  parser.add_argument("--jdk", required=True,
                      help="Java Development Kit location")
  parser.add_argument("--sdk-root", required=True, help="Android SDK location")
  parser.add_argument("--ndk-root", required=True, help="Android NDK location")
  parser.add_argument("--ndk-platform", default="android-18",
                      help="Android platform (must be >= android-18)")
  parser.add_argument("--ant", required=True, help="ant binary location")
  parser.add_argument("--num-processes", default="1",
                      help="Number of processes to use for 'make'")
  parser.add_argument("--output-apk", "-o", required=True,
                      help="Destination of produced APK")

  class ParsedArgs(object):
    """Class used to collect arguments from argparse."""
    pass

  # These calls will leave the parsed_args object with one attr per option. It
  # also will exit if there were issues parsing the arguments.
  parsed_args = ParsedArgs()
  parser.parse_args(namespace=parsed_args)

  # Make sure the root paths are absolute.
  orig_cwd = os.getcwd()
  voltair_root = os.path.join(orig_cwd, parsed_args.voltair_root)
  liquidfun_root = os.path.join(orig_cwd, parsed_args.liquidfun_root)
  qt_root = os.path.join(orig_cwd, parsed_args.qt_root)

  # Qt's deployment script requires you build into subdir of voltair_root.
  build_dir = os.path.join(voltair_root, parsed_args.build_dir)

  if os.path.exists(build_dir):
    err = "Error: Target directory %s exists. Exiting" % build_dir
    print >> sys.stderr, err
    return -1

  try:

    # Move to liquidfun directory and build it.
    RunLiquidFunNdkBuild(liquidfun_root + "/Box2D", parsed_args.ndk_root)

    # Create and move to voltair build target dir and start building.
    os.mkdir(build_dir)
    Pushd(build_dir)

    # What follows are the required steps for building the an APK in Qt.  First
    # we need to set up the environment as certain of the steps read it.
    SetEnvironment(parsed_args.sdk_root, parsed_args.ndk_root,
                   parsed_args.ndk_platform)

    # 'qmake' is Qt's project builder. It will construct a Makefile that is then
    # run.
    RunQmake(qt_root, voltair_root)

    # Run the makefile, which results in the building of the libVoltAir.so file.
    RunMake(parsed_args.num_processes)

    # This places the libVoltAir.so file in the appropriate directory.
    RunMakeInstall()

    # Runs 'androiddeployqt' which constructs the APK from the libVoltAir.so and
    # the other files specified in the Qt project (e.g. java files,
    # AndroidManifest.xml, and so on).
    RunAndroidDeployQt(qt_root, voltair_root, build_dir, parsed_args.ant,
                       parsed_args.ndk_platform, parsed_args.jdk)

    # The 'androiddeployqt' executable leaves the APK in
    # QtApp-release.apk. Move it to a more descriptive location (i.e.
    # VoltAir.apk).
    RenameApk(parsed_args.output_apk)

  except RunProcessError, error:
    print >> sys.stderr, str(error)
    return error.return_code
  finally:
    Popd()

    # Remove the build dir in order to leave qt tree as we found it.
    RemoveBuildDir(build_dir)

  return 0


if __name__ == "__main__":
  sys.exit(main())
