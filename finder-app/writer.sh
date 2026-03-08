#!/bin/sh

# get parameters
writefile=$1
writestr=$2

# check if there are 2 parameters
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Missing arguments. Usage: ./writer.sh <wrtiefile> <writestr>"
    exit 1
fi

# get the path of writefile
dirpath=$(dirname "$writefile")

# if the directoty does not exist, then create one
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $dirpath."
        exit 1
    fi
fi

# write the file and overwrite any existing content
echo "$writestr" > "$writefile"

# chech if the file is written
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to file $writefile."
    exit 1
fi
