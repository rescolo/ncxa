#!/usr/bin/env bash
if [ ! "$1" ];then
   echo USAGE: $0 KML_FILE
   exit
fi
#WARNIG: Replace only the first instance!
file="$1"
sed -i s'/<name>Path<\/name>/<name>Path<\/name><description><![CDATA[<img src="https:\/\/raw.githubusercontent.com\/rescolo\/ncxa\/master\/wikiloc.png" height="30" width="auto" \/><br><br><a href="http:\/\/www.wikiloc.com\/wikiloc\/view.do?id=5975656">TROCHA PAN DE AZUCAR - PUEBLO VIEJO 24.7 Km<\/a><br\/><a href="http:\/\/www.wikiloc.com\/wikiloc\/view.do?id=5975656">http:\/\/www.wikiloc.com\/wikiloc\/view.do?id=5975656<\/a>]]><\/description>/' $file
