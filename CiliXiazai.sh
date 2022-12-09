#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

rootdir=$(pwd)

mkdir $rootdir/download
mkdir $rootdir/cache
cd $rootdir/cache

npm install -g t-get

tget 'magnet:?xt=urn:btih:5b4848cc863505df9c1a0e8ade329bf66d151141&dn=Mad+Games+Tycoon+2+V2022.12.02B&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451&tr=udp://tracker.internetwarriors.net:1337&tr=udp%3A%2F%2Fexodus.desync.com%3A6969'

echo ====folder $(pwd)====
ls

cd $(ls)
echo ====folder $(pwd)====
ls

fname=$(find . -size +2000M)
echo ====fname====
echo $fname
echo ====split file====
split -b2000M --verbose $fname $fname\_
echo ====after split====
ls
rm -f $fname
echo ====after remove original file====
ls

mv ./* $rootdir/download/

IFS=$SAVEIFS
