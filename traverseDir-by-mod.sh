#traverse directory recursively and move each file to a separate folder named "yyyy-mm-dd" based on a file modification date

find . -iname '*.jpg' -print0 | while IFS= read -r -d '' f
do
    if [ ! -d "$f" ]; then
        #echo "$f" "->" "$(date -r "$f" +"%Y-%m-%d")"/"$(date -r "$f" +"%Y%m%d_%H%M%S").jpg"
        
        if [ ! -d "$(date -r "$f" +"%Y-%m-%d")" ]; then
            mkdir "$(date -r "$f" +"%Y-%m-%d")"
        fi

        mv "$f" "$(date -r "$f" +"%Y-%m-%d")"/"$(date -r "$f" +"%Y%m%d_%H%M%S").jpg"
    fi
done
