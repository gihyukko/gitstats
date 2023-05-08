#!/bin/bash

### shell script for automatically pulling git repos
### works with bash version 3.2+

# check if git exists
if [ "$(which git)" == "" ] ; then
    echo "git not installed!" && exit
fi

# home directory
homedir="$HOME/Documents/"

# git repos under homedir
repos=$(find "$homedir" -name .git -type d)

for d in $repos ; do
    cd ${d%/*};
    echo ${d%/*};
    git pull
done
