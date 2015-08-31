fullist=$(ls -l *.kml |awk '{print $9}' | grep -E '^[0-9][0-9][0-9]')
km=0
m=0
for file in $fullist;do
    kmn=$(awk -F"<b>Cycling distance:</b>" '{print $2}' "$file"  | awk -F"km." '{print $1}' | awk -F"-" '{print $2}' | grep -E '^\s*[0-9]')
    km=$(($km+$kmn))
    #echo $file $km $kmn
    mn=$(awk -F"<b>Uphill:</b> " '{print $2}' "$file"  | awk -F"meters" '{print $1}' | grep -E '^\s*[0-9]')
    m=$(($m+$mn))

done
echo $km $m
sed -ri "s/(div id='Distance'>Total recorrido: )[0-9]+/\1$km/" ../index.php
sed -ri "s/(div id='Desnivel'>Desnivel total: )[0-9]+/\1$m/" ../index.php

