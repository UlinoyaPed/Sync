#!/bin/sh

rootdir=$(pwd)
url=https://img.lulufind.com/mrzy_teacher_ogKuZ5X5uojeFovO1VrsOcBpIlAA_file_166047129420524165.docx

mkdir ./cache
cd ./cache

wget -q $url
fname=$(ls)

for ((i=1;i<=100;i++))
do
wget -q $url -O $i\_$fname
done

mkdir $rootdir/download/
tar -zcvf $rootdir/download/$fname\.tar.gz ./*