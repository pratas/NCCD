#!/bin/bash
echo "Downloading and installing GeCo ...";
sudo apt-get install cmake
wget https://github.com/pratas/geco/archive/master.zip
unzip master.zip
cd geco-master
cmake .
make
chmod +x GeCo
cp GeCo ../data/
cd ../
rm -fr geco-master
echo "Done!";
