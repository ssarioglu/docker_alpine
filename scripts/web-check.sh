#!/bin/bash
echo use script with ./web-check.sh www.nba.com Basketball

while [ 1 ];
do
    count=`curl -s "$1" | grep -c "$2"`

    if [ "$count" != "0" ]
    then
       echo "$1 updated!"
       exit 0
    fi
    sleep 10
done
