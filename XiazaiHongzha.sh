#!/bin/bash

rootdir=$(pwd)
url=https://img.lulufind.com/mrzy_teacher_ogKuZ5X5uojeFovO1VrsOcBpIlAA_file_166047129420524165.docx

mkdir ./cache/
cd ./cache/

wget -q $url
fname=$(ls)
sum=0

for i in {1..10}
do
	((sum+=1))
	wget -q $url -O $sum\_$fname
done

mkdir $rootdir/download/
tar -zcvf $rootdir/download/$fname\.tgz ./*