fullist=$(ls -l *.kml |awk '{print $9}' | grep -E '^[0-9][0-9][0-9]')
km=0
for file in $fullist;do
    kmn=$(awk -F"<b>Cycling distance:</b>" '{print $2}' "$file"  | awk -F"km." '{print $1}' | awk -F"-" '{print $2}' | grep -E '^\s*[0-9]')
    km=$(($km+$kmn))
    echo $file $km $kmn
done
echo $km
