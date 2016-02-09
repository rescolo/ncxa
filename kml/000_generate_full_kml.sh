fullist=$(ls -l *.kml |awk '{print $9}' | grep -E '^[0-9][0-9][0-9]')
if [ ! "$2" ];then
    echo USAGE $0 istart iend
    exit
fi
istart=$1
iend=$2
i=0

for f in $fullist;do
 i=$(($i+1))
 if [ $i -lt $istart ] || [ $i -gt $iend ] ; then
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
./000_catkml.sh "$fullist" > ../map_all_${istart}_${iend}.kml
test=$(cat ../map_all_${istart}_${iend}.kml | sed -r 's/(<name>Path<\/name><description>)/\1\n/g' | grep "<name>Path<\/name><description>" | wc -l)
if [ "$test" == $((1+$iend-$istart))  ];then
    echo "TEST PASSED"
fi
./000_statistics.sh
