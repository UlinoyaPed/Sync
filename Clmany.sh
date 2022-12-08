#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

rootdir=$(pwd)

mkdir $rootdir/download
mkdir $rootdir/cache
cd $rootdir/cache

npm install -g t-get

line=$(wc -l $rootdir/cili.list | awk '{print $1}')
sum=0

for i in {1..$line}
do
	((sum+=1))
	link=$(sed -n $sum\p $rootdir/cili.list)
	tget $link
	
	echo ====folder $(pwd)====
	ls
	
	dir=$(ls -d */)
	if [! -n "$dir"]; then
	else
		cd $dir
		echo ====folder $(pwd)====
		ls
		mv ./* ../
		cd ../
		rm -rf $dir
		echo ====folder $(pwd)====
		ls
	fi
	
	fname=$(find . -size +2000M)
	if [! -n "$fname"]; then
	else
		echo ====fname====
		echo $fname
		echo ====split file====
		split -b2000M --verbose $fname $fname\_
		echo ====after split====
		ls
		rm -f $fname
		echo ====after remove original file====
		ls
	fi
	
	mv ./* $rootdir/download/
done

IFS=$SAVEIFS
