#!/bin/bash
#traverse directory recursively and move each file to a separate folder named "yyyy-mm-dd" based on a file modification date

if [ "$#" -ne 1 ]; then
    echo "File mask not provided as the first argument!"
    exit 1
fi

find . -iname "$1" -print0 | while IFS= read -r -d '' f
do
    if [ ! -d "$f" ]; then
        #echo "$f" "->" "$(date -r "$f" +"%Y-%m-%d")"/"$(date -r "$f" +"%Y%m%d_%H%M%S").jpg"
        
        if [ ! -d "$(date -r "$f" +"%Y-%m-%d")" ]; then
            mkdir "$(date -r "$f" +"%Y-%m-%d")"
        fi

        ext="${f##*.}"
        mv "$f" "$(date -r "$f" +"%Y-%m-%d")"/"$(date -r "$f" +"%Y%m%d_%H%M%S").$ext"
    fi
done
