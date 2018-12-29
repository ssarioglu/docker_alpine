#!/bin/bash

if [ -z "$1" ]
  then
    echo "use script with ulr like ./web-check.sh www.nba.com"
    exit 0
fi

URL=$1

for (( ; ; )); do
    mv new.html old.html 2> /dev/null
    curl $URL -L --compressed -s > new.html
    DIFF_OUTPUT="$(diff new.html old.html)"
    if [ "0" != "${#DIFF_OUTPUT}" ]; then

         echo "$1 changed!"
        sleep 10
    fi
done