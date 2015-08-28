#!/usr/bin/env bash
if [ ! "$1" ];then
    echo USAGE $0 WIKILOC_KML_FILE
    exit
fi
DEBUG=False
file="$1"
lastcoordinates=$(sed -r 's/(<\/coordinates>)/\1\n/g' "$file" | grep '<\/coordinates>' | sed -r 's/\ /\n/g' | tail -n2 | grep -v '<\/coordinates>')
iconpos=$(sed -r 's/(<\/coordinates>)/\1\n/g' "$file" | grep '<\/coordinates>' | sed -r 's/\ /\n/g' | head -n100 | grep '<\/coordinates>' | awk -F"<Point>" '{print $2}')

if [ $DEBUG = True ];then
    >&2 echo $lastcoordinates
    >&2 echo $iconpos
fi
sed -ri  's/(<coordinates>)[\.\,0-9\-]+(<\/coordinates>)/\1'$lastcoordinates'\2/' "$file"

if [ $DEBUG = True ];then
    >&2 echo "====Final File===="
    linesed=$(sed -r 's/ /\n/g' "$file" | sed -r 's/(<\/coordinates>)/\1\n/'  | grep "$(echo $lastcoordinates|  sed -r 's/^\-//')")
    >&2 echo $linesed
fi

