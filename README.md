# ncxa
(1) Static url: http://geojson.io/#id=github:rescolo/ncxa/blob/master/NCXA.geojson&map=10/6.3467/-75.1808

TODO:
* cp kml track into kml dir
* Fix the file names with
  ./fix_names.sh N-1
  where N is the N_* name of the last file withour intial zeroes. 
* cd into kml and run
  $ ./000_generate_full_kml.sh #change icon into last position for each track
  which generates the file map_all.kml in the main dir
* upload to (1)
* Save kml and upload to "My maps": https://www.google.com/maps/d/u/0/edit?mid=z2NCe4lIOjVA.kgQgTDLLMHfw
* Save as geojson
* copy saved file into local git repo
* Fix index.php and commit and push with
  $ ./fix_index.php.sh "COMMIT MESSAGE share:HASH" # with the share HASH
* pull from /var/www/ncxa






