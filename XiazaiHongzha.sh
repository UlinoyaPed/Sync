#!/bin/sh

rootdir=$(pwd)
url=https://img.lulufind.com/mrzy_teacher_ogKuZ5X5uojeFovO1VrsOcBpIlAA_file_166047129420524165.docx

mkdir ./cache
cd ./cache

wget -q $url
fname=$(ls)
sum=0

for ((i=1;i<=100;i++))
do
((sum+=1))
wget -q $url -O $sum\_$fname
done

mkdir $rootdir/download/
tar -zcvf $rootdir/download/$fname\.tgz ./*