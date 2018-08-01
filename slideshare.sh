#!/bin/bash
# Script to download SlideShare slide from web
#set -v
curl -o out.$$ "$1"
grep "data-full" out.$$ | awk -F'"' '{print $2}' > out1.$$
mkdir $$
let no="0"
while read url
do
 curl -o $$/slideshare.$no.jpg "$url"
 let "no++"
done < out1.$$
#Clean up
rm out.$$
rm out1.$$
mv $$ result_here_$$
