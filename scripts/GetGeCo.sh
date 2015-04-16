#!/bin/bash
echo "Downloading and installing GeCo ...";
sudo apt-get install cmake
wget https://github.com/pratas/geco/archive/master.zip
unzip master.zip
cd geco-master
cmake .
make
cp GeCo ..
cd ..
rm -fr geco-master
chmod +x GeCo
echo "Done!";
