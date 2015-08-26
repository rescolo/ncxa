./000_catkml.sh $(ls -l *.kml |awk '{print $9}' | grep -E '^[0-9][0-9][0-9]') > ../map_all.kml
