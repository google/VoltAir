#!/bin/sh -x
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

# Simple script that creates a transient branch, gh-pages, and pushes it down to github.
# Assumes that the documentation has already been built. See build_docs.py

# Runs from the project's top-level directory only.
gitrepo=${GITREPO-git@github.com:google/VoltAir.git}

# Create an orphan branch with nothing in it.
git branch -D gh-pages
git checkout --orphan gh-pages

git add index.html
git add doc/API-Ref
git add doc/building
git add doc/contributing
git add doc/main
git commit -m "gh-pages"
git remote add github $gitrepo
git push -u -f github gh-pages:gh-pages
