#!/usr/bin/env bash
if [ ! "$1" ];then
    echo USAGE: $0 MESSAGE
    exit
fi
git pull origin master
if [ -f nacx2 ]; then
    cat ncxa2 > NCXA.geojson
    git rm ncxa2
    git commit -a -m "$message"
    git push origin master
else
    echo No new file found!
fi
