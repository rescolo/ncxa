#!/usr/bin/env bash
#Install from https://github.com/mapbox/togeojson
if [ ! "$1" ];then
    echo USAGE: $0 KMLFILE
    exit
fi
kmlfile="$1"
basefile=$(basename "$kmlfile" kml| sed 's/map_all/NCXA/' )
togeojson "$kmlfile" | perl -p -e 's/\n//g' | perl -p -e 's/\s{2,}//g' > "$basefile"geojson
