#!/bin/sh

# HYD by Thomas Lord
# Version 1.0alpha

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

SOURCE_ROOT_PATH="$HOME/Programming/personal/compileand.run"
SOURCE_PATH="$SOURCE_ROOT_PATH/hpstr-jekyll-theme-master"
TARGET_ROOT_PATH="$HOME/Programming/personal/compileand.run"
TARGET_PATH=$TARGET_ROOT_PATH
SCRATCH_PATH="$HOME/_hyd_scratch"

cd $SOURCE_ROOT_PATH
git checkout $SOURCE_BRANCH

mkdir $SCRATCH_PATH
cd $SCRATCH_PATH
jekyll build --source $SOURCE_PATH --destination $SCRATCH_PATH

cd $TARGET_ROOT_PATH
git checkout $TARGET_BRANCH
cp -R -v $SCRATCH_PATH/* $TARGET_PATH/
git add -A
git commit -m "Autodeployed by HYD"
git push
rm -rf $SCRATCH_PATH
