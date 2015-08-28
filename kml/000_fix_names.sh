if [ ! "$1" ];then
    echo USAGE $0 N-1
    exit
fi
files=$(ls -lt | awk '{print $9}' | grep -E '^[a-zA-Z]')
i=$1
for f in $files;do
   i=$(($i+1))
   if [ $i -lt 10 ];then
       p=00$i
   elif [ $i -lt 100 ];then
       p=0$i
   else
       p=$i
   fi
   git mv $f ${p}_$f
done


