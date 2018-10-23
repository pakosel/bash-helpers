#!/bin/bash
#traverse directory recursively and move each file beginning with "yyyymmdd_" to a separate folder named "yyyy-mm-dd". 
#DOES NOT VALIDATE filename nor detect duplicates!

if [ "$#" -ne 1 ]; then
    echo "File mask not provided as the first argument!"
    exit 1
fi

find . -iname "$1" -print0 | while IFS= read -r -d '' f
do
    if [ ! -d "$f" ]; then
#        echo "$f" "->" "${f%_*}"
#        echo "$f" "->" "${f#*_}"
#        echo "$f" "->" "${f##*_}"
         fn="${f##*/}"
         dir="${fn%%_*}"
         dirD="${dir:0:4}-${dir:4:2}-${dir:6:2}"

         #echo "$f" "->" "${dirD}"
        
        if [ ! -d "${dirD}" ]; then
            mkdir "${dirD}"
        fi

        mv -vn "$f" "${dirD}"/
    fi
done
