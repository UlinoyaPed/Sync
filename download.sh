#!/bin/bssh

mkdir ./download
cd ./download
wget -i ./download_list.txt

apt install -y npm
npm install -g t-get
tget 'magnet:?xt=urn:btih:EECDC83008333BC6A69A1458663CE4741B515921'