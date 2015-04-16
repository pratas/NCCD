#!/bin/bash
##### PARAMETERS ###############################################################
GPARAMETERS=" -rm 2:1:0:0/0 -rm 6:1:10:0/0 -rm 10:50:0:0/0 -rm 14:200:0:0:/0 -rm 18:1000:1:3/100 -g 30 "
VBASE="virus/"
BBASE="bacteria/"
################################################################################
################################################################################
##### INSTALL ##################################################################
if false; then
echo "Installing ...";
##### DOWNLOAD COMPRESSOR ######################################################
wget https://github.com/pratas/geco/archive/master.zip
unzip master.zip
cd geco-master
make
cp GeCo ..
cd ..
rm -fr master.zip geco-master
chmod +x GeCo
##### DOWNLOAD GOOSE ###########################################################
wget https://github.com/pratas/goose/archive/master.zip
unzip master.zip
cd goose-master
make
cp Info ..
cd ..
rm -fr master.zip goose-master
chmod +x Info
##### DOWNLOAD DATA ############################################################
mkdir $VBASE
mkdir $BBASE
cd $VBASE
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/Viruses/all.fna.tar.gz
tar -xvf all.fna.tar.gz
rm -f all.fna.tar.gz
cd ../$BBASE
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/Bacteria/all.fna.tar.gz
tar -xvf all.fna.tar.gz
rm -f all.fna.tar.gz
cd ..
echo "Installation complete!";
fi
################################################################################
################################################################################
##### PRE-PROCESS ##############################################################
if false; then
echo "Pre-processing ...";
VPATH=($(ls $VBASE));
BPATH=($(ls $BBASE));
for((p=0; p<$(echo ${#VPATH[@]}); ++p));
  do
  echo "Processing ${VPATH[$p]} ...";
  rm -f $VBASE${VPATH[$p]}/*.run;
  VIRUS=($(ls $VBASE${VPATH[$p]}));
  for((v=0; v<$(echo ${#VIRUS[@]}); ++v));
    do
    cat $VBASE${VPATH[$p]}/${VIRUS[$v]} | grep -v ">" | tr -d -c "ACUGT" | \
        tr 'U' 'T' > $VBASE${VPATH[$p]}/${VIRUS[$v]}.run;
    done
  done
for((p=0; p<$(echo ${#BPATH[@]}); ++p));
  do
  echo "Processing ${BPATH[$p]} ...";
  rm -f $BBASE${BPATH[$p]}/*.run
  BACTERIA=($(ls $BBASE${BPATH[$p]}));
  for((v=0; v<$(echo ${#BACTERIA[@]}); ++v));
    do
    cat $BBASE${BPATH[$p]}/${BACTERIA[$v]} | grep -v ">" | tr -d -c "ACUGT" | \
        tr 'U' 'T' > $BBASE${BPATH[$p]}/${BACTERIA[$v]}.run
    done
  done
echo "Pre-processing complete!";
fi
################################################################################
################################################################################
##### RUNNING ##################################################################
if true; then
VPATH=($(ls $VBASE));
BPATH=($(ls $BBASE));
for((p1=0; p1<$(echo ${#BPATH[@]}); ++p1));
  do
  BACTERIA=($(ls $BBASE${BPATH[$p1]}/*.run));
  for((v1=0; v1<$(echo ${#BACTERIA[@]}); ++v1));
    do
    rm -f DISTANCE-$(echo ${BACTERIA[$v1]} | tr '/' '+');
    for((p2=0; p2<$(echo ${#VPATH[@]}); ++p2));
      do
      echo "Processing ${BPATH[$p1]} Vs ${VPATH[$p2]} ...";
      VIRUS=($(ls $VBASE${VPATH[$p2]}/*.run));
      for((v2=0; v2<$(echo ${#VIRUS[@]}); ++v2));
        do
        rm -f $VBASE${VPATH[$p2]}/${VIRUS[$v2]}.run.co ;
        (./GeCo -v $GPARAMETERS -r ${BACTERIA[$v1]} ${VIRUS[$v2]}) &> \
        REPORT.run;
        rm -f $VBASE${VPATH[$p2]}/${VIRUS[$v2]}.run.co ;
        echo "$(echo $(cat REPORT.run | grep 'Distance:' | awk \
        '{ print $6;}')) ${VIRUS[$v2]} ${BACTERIA[$v1]}" >> \
        DISTANCE-$(echo ${BACTERIA[$v1]} | tr '/' '+');
        done
      done
    done
  done
echo "DONE ALL!";
fi
###############################################################################
