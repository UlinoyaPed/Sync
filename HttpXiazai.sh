#!/bin/sh

rootdir=$(pwd)
mkdir ./download
cd ./download
wget -q https://releases.ubuntu.com/22.04.1/ubuntu-22.04.1-desktop-amd64.iso
echo ====folder $(pwd) ====
ls
fname=$(ls *.*)
echo ====name of download file====
echo $fname
echo ====split file====
split -b1999M --verbose $fname $fname\_
echo ====after split====
ls
rm -f $fname
echo ====after remove original file====
ls