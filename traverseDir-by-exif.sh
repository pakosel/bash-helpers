#!/bin/bash
#traverse directory recursively and find all JPG files
#Rename them according to EXIF data

find . -iname "*.jpg" | xargs exiv2 rename -F