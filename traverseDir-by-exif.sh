#!/bin/bash
#traverse directory recursively and find all JPG files
#Rename them according to EXIF data

if [ "$#" -ne 1 ]; then
    echo "File mask not provided as the first argument!"
    exit 1
fi

find . -iname "$1" | xargs exiv2 rename -F