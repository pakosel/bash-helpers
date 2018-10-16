#traverse directory recursively and move each file beginning with "yyyymmdd_" to a separate folder named "yyyy-mm-dd". 
#DOES NOT VALIDATE filename nor detect duplicates!

find . -iname '*.jpg' -print0 | while IFS= read -r -d '' f
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
