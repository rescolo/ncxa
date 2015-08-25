#!/usr/bin/env bash
if [ ! "$1" ];then
    echo USAGE: $0 MESSAGE
    exit
fi
$message="$1"
git pull origin master
if [ -f ncxa ]; then
    cat ncxa > NCXA.geojson
    git rm ncxa
    git commit -a -m "$message"
    git push origin master
else
    echo No new file found!
fi
