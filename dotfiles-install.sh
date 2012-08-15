#!/usr/bin/env bash

# Directory of this script, see http://is.gd/lUsWul
SOURCE="${BASH_SOURCE[0]}"
DIR=$( dirname "$SOURCE" )

while [ -h "$SOURCE" ]; do
    SOURCE=$(readlink "$SOURCE")
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
    DIR=$( cd -P "$( dirname "$SOURCE"  )" && pwd )
done
DIR=$( cd -P "$( dirname "$SOURCE" )" && pwd )

# Find files prefixed with underscore
FILES=$( find $DIR -maxdepth 1 -name '_*')

for file in $FILES; do
    dotfile=${file/$DIR\/_/$HOME\/.}
    echo "copying ${file} to ${dotfile}"
    [[ -e $dotfile ]] && rm -rf $dotfile
    cp -r $file $dotfile
done
