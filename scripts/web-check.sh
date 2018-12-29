#!/bin/bash
echo use script with ./web-check.sh www.nba.com

URL=$1

for (( ; ; )); do
    mv new.html old.html 2> /dev/null
    curl $URL -L --compressed -s > new.html
    DIFF_OUTPUT="$(diff new.html old.html)"
    if [ "0" != "${#DIFF_OUTPUT}" ]; then

         echo "$1 updated!"
        sleep 10
    fi
done