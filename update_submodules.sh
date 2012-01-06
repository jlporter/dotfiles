#!/usr/bin/env sh
SUBMODULES=`git submodule | awk '{print $2}'`
TOPDIR=$PWD

for submodule in $SUBMODULES
do
    echo $submodule
    cd $submodule
    git checkout master
    git pull
    cd $TOPDIR
    echo
done 
