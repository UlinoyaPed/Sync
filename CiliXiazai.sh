#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

rootdir=$(pwd)

mkdir $rootdir/download
mkdir $rootdir/cache
cd $rootdir/cache

npm install -g t-get

tget 'magnet:?xt=urn:btih:35D760008EC922B341A286A0B3DBCD08A2488D99'

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
