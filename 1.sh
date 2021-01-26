#!/bin/bash
ech "   1.install screen      2.install/update idena node
   3.get api.key         4.exchange api.key
   5.get idena nodekey   6.killall screen and exchange nodekey
   7.reboot/start  idena   8.killall screen（idena）
   9.chmod node  10.rm-rf ipfx  
   11.screen -r  12.reboot
     type in your choose:"
read num
if [[ "$num" -eq 1 ]];
then
apt update -y
apt install screen -y;

elif [[ "$num" -eq 2 ]];
then
echo Type in new node version \(eg. 0.19.3\)
read version
cd ~
mkdir idena
cd ./idena && wget https://github.com/idena-network/idena-go/releases/download/v$version/idena-node-linux-$version
mv idena-node-linux-$version idena-go
chmod +x idena-go
screen -d -m ./idena-go;

elif [[ "$num" -eq 3 ]];
then
cat ./idena/datadir/api.key;

elif [[ "$num" -eq 4 ]];
then
echo Type in new api
read api
screen -d -m ./idena-go --apikey=api;

elif [[ "$num" -eq 5 ]];
then
cat ./idena/datadir/keystore/nodekey;

elif [[ "$num" -eq 6 ]];
then
killall screen
nano ./idena/datadir/keystore/nodekey;
screen -d -m ./idena-go;

elif [[ "$num" -eq 7 ]];
then 
cd ~
cd idena
screen -d -m ./idena-go;

elif [[ "$num" -eq 8 ]];
then 
killall screen;

elif [[ "$num" -eq 9 ]];
then
cd ~
cd ./idena/
chmod +x idena-go
screen -d -m ./idena-go;

elif [[ "$num" -eq 10 ]];
then 
cd ~
cd idena
cd datadir
rm -rf ipfs;

elif [[ "$num" -eq 11 ]];
screen -r;

elif [[ "$num" -eq 12 ]];
reboot
fi
