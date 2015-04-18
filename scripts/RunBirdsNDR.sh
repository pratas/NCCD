#!/bin/bash
#. GetBirds.sh
#. GetGeco.sh
cp NDR.sh data/
cd data/
rm -f matrix_NDR ;
for((x=1 ; x<=48 ; ++x));
  do
  for((y=1 ; y<=48 ; ++y));
    do
    rm -f OUTPUT_NDR;
    (. NDR.sh FB$x FB$y ) > OUTPUT_NDR ;
    RESULT_NDR=`cat OUTPUT_NDR | grep "NDR" | awk '{ print $2;}'`;
    printf "$RESULT_NDR\t" >> matrix_NDR ;
    done
  printf "\n" >> matrix_NDR ;
  done
