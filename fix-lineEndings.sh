#!/bin/bash
#Removes Win line endings from the fiven file(s). DOES NOT CREATE A BACKUP

if [ "$#" -ne 1 ]; then
    echo "File mask not provided as the first argument!"
    exit 1
fi

find . -iname "$1" -print0 | while IFS= read -r -d '' f
do
    sed -i 's/\r$//' "$f"
done