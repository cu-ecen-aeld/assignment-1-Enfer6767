#!/bin/sh

# get parameters
filesdir=$1
searchstr=$2

# check if there are 2 parameters
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Error: Missing arguments. Usage: ./finder.sh <filesdir> <searchstr>"
    exit 1
fi

# check if filesdir is a valid directory 
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory on the filesystem."
    exit 1
fi

# count the total amount of files
X=$(find "$filesdir" -type f | wc -l)

# count the total amount of lines that match
Y=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $X and the number of matching lines are $Y"
