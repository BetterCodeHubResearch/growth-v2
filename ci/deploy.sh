#! /usr/bin/env sh
#
#fir publish ./platforms/android/build/outputs/apk/android-debug.apk -s 'growth2' -T $API_TOKEN
#
#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd stage/

git init
git config user.name "Robot"
git config user.email "robot@phodal.com"

git remote add upstream "https://$GH_TOKEN@github.com/phodal/growth-web.git"
git fetch upstream
git reset upstream/gh-pages

cp -a ../content/www .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages