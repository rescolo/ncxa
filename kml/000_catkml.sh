#!/usr/bin/env bash
if [ ! "$1" ];then
   echo USAGE LIST_OF_FILENAMES
   exit
fi
header='<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://earth.google.com/kml/2.0"><Document>'
footer='</Document></kml>'
echo -n "$header"
list="$@"
for file in $list;do
    body=$(cat "$file" | awk -F"<Document>" '{print $2}' | awk -F"</Document>" '{print $1}')
    echo -n $body
done
echo -n $footer
