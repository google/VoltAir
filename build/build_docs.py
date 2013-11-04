#!/usr/bin/python
#
# Copyright 2014 Google Inc. All Rights Reserved.
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

"""Builds a VoltAir Documentation."""
import argparse
import os
import re
import shutil
import subprocess
import sys


_dirstack = []


def Pushd(directory):
  """Pushes directory onto a stack.

  Args:
    directory: directory to push
  """
  _dirstack.append(os.getcwd())
  os.chdir(os.path.abspath(directory))


def Popd():
  """Pops and returns the top of the directory stack.
  """
  os.chdir(_dirstack.pop())


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


def RunSubprocess(argv, rundir=None, env=None):
  """Runs a process, printing important info, such as the command.

  Args:
    argv: list of arguments to process. Zeroeth arg is process to run.
    rundir: (optional) Directory in which to run the process.
    env: (optional) Environment in which to run process.

  Raises:
      RunProcessError: If the subprocess returns fails
  """

  try:
    if rundir is not None:
      Pushd(rundir)
    joined_argv = " ".join(argv)
    err = "Running subprocess: %s in %s" % (joined_argv, os.getcwd())
    print >> sys.stderr, err
    process = subprocess.Popen(argv, env=env)
    process.wait()
    print >> sys.stderr, "Subprocess succeeded."
  finally:
    if rundir is not None:
      Popd()
    if process.returncode:
      raise RunProcessError(joined_argv, process.returncode)


def RunDoxygenForDir(docdir, rundir=None, env=None):
  """Runs a doxygen process.

  Args:
    docdir: Directory in which you'll find the doxyfile.
    rundir: (optional) Directory in which to run the process.
    env: (optional) Environment in which to run process.
  """
  dstdir = "../doc/%s" % docdir
  if os.path.exists(dstdir):
    shutil.rmtree(dstdir)
  args = ["doxygen", "doxyfile"]
  RunSubprocess(args, rundir=rundir, env=env)


def main():
  parser = argparse.ArgumentParser(description="Build VoltAir Documentation")
  parser.add_argument("--qt-root", required=True, help="Dir for Qt (>= Qt 5.3)")
  parser.add_argument("--skip-api", default=False, action="store_true",
                      help="Skip building API documentation")

  class ParsedArgs(object):
    """Class used to collect arguments from argparse."""
    pass

  # These calls will leave the parsed_args object with one attr per option. It
  # also will exit if there were issues parsing the arguments.
  parsed_args = ParsedArgs()
  parser.parse_args(namespace=parsed_args)

  try:
    qt_root = parsed_args.qt_root
    skip_api = parsed_args.skip_api
    if not os.path.exists(qt_root):
      print >> sys.stderr, "qt-root %s does not exist. Exiting." % qt_root
      return -1
    if not os.path.isdir(qt_root):
      print >> sys.stderr, "qt-root %s is not directory. Exiting." % qt_root
      return -1
    version = None
    for elt in os.listdir(qt_root):
      if re.match(r"^\d*\.\d*$", elt) is not None:
        version = elt
    if version is None:
      print >> sys.stderr, "%s has no version directory. Exiting." % qt_root
      return -1

    env = os.environ.copy()
    env["VERSION"] = version
    env["DOCDIR"] = os.path.normpath(os.path.join(qt_root, "Docs"))

    if not skip_api:
      RunDoxygenForDir("API-Ref", rundir="../VoltAir", env=env)

    for subdir in ["main", "gettingStarted", "contributing"]:
      RunDoxygenForDir(subdir, rundir="../doc/src/%s" % subdir)

    # Finally, copy over the index.html to root. It's just a redirect link.
    shutil.copyfile("../doc/index.html", "../index.html")

  except RunProcessError, error:
    print >> sys.stderr, str(error)
    return error.return_code

  return 0


if __name__ == "__main__":
  sys.exit(main())
