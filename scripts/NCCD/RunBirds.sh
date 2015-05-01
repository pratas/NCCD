#!/bin/bash
. ../download/GetBirds.sh
. ../download/GetGeco.sh
cp NCCD.sh ../data/
cd ../data/
rm -f matrix ;
for((x=1 ; x<=48 ; ++x));
  do
  for((y=$x ; y<=48 ; ++y));
    do
    rm -f OUTPUT;
    (. NCCD.sh FB$x FB$y ) > OUTPUT ;
    RESULT_NCCD=`cat OUTPUT | grep "NCCD" | awk '{ print $2;}'`;
    printf "$RESULT_NCCD\t" >> matrix ;
    done
  printf "\n" >> matrix ;
  done
