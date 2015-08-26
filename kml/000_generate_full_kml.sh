fullist=$(ls -l *.kml |awk '{print $9}' | grep -E '^[0-9][0-9][0-9]')
if [ ! "$1" ];then
    echo USAGE $0 istart
    exit
fi
istart=$1
i=0

for f in $fullist;do
 if [ $i -lt $(($istart-1)) ]; then   
   i=$(($i+1))
   if [ $i -lt 10 ];then
       fullist=$(echo "$fullist" | grep -v '^00'$i'_')
   elif  [ $i -ge 10 ] && [ $i -lt 100 ];then
       fullist=$(echo "$fullist" | grep -v '^0'$i'_')
   else
       fullist=$(echo "$fullist" | grep -v '^'$i'_')       
   fi
 fi
done
>&2 echo processing...
>&2 echo $fullist
./000_catkml.sh "$fullist" > ../map_all.kml
