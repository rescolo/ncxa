#!/usr/bin/env bash
if [ ! "$1" ];then
   >2& echo USAGE: $0 KML_FILE
   exit
fi
#WARNIG: Replace only the first instance!
file="$1"
DEBUG=False
if [ "$(grep '<name>Path<\/name><description>' "$file")" ];then
    if [ "$DEBUG" == True ];then
	>&2 echo already processed
    fi
    exit
fi

trackname=$(awk -F"<Placemark><name>" '{print $2}' "$file" | awk -F"</name>" '{print $1}' | grep -E '^[0-9A-Za-z]')
trackname=$(echo "$trackname" | sed 's/\ /_/g')
id=$(awk -F'http://www.wikiloc.com/wikiloc/view.do\\?id=' '{print $2}' "$file"  | awk -F'">' '{print $1}')
id=$(awk -F'http://www.wikiloc.com/wikiloc/view.do\\?id=' '{print $2}' "$file"  | awk -F'">' '{print $1}' | grep -E '^[0-9]')
sed -i s'/<name>Path<\/name>/<name>Path<\/name><description><![CDATA[<img src="https:\/\/raw.githubusercontent.com\/rescolo\/ncxa\/master\/wikiloc.png" height="30" width="auto" \/><br><br><a href="http:\/\/www.wikiloc.com\/wikiloc\/view.do?id='$id'">'$trackname'<\/a><br\/><a href="http:\/\/www.wikiloc.com\/wikiloc\/view.do?id='$id'">http:\/\/www.wikiloc.com\/wikiloc\/view.do?id='$id'<\/a>]]><\/description>/' $file
