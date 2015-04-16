#!/bin/bash
. GetGeco.sh
. GetBirds.sh
cp NCCD.sh data/
cd data/
rm -f matrix ;
for((x=1 ; x<=48 ; ++x));
  do
  for((y=1 ; y<=48 ; ++y));
    do
    rm -f OUTPUT;
    (. NCCD.sh FB$x FB$y ) > OUTPUT ;
    cat OUTPUT | grep "NCCD" | awk '{ print $2;}' >> matrix ;
    printf "\t" >> matrix ;
    done
  printf "\n" >> matrix ;
  done
