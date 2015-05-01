#!/bin/bash
xseq=$1;
rm -f VECTOR_NDR_$xseq ;
for((yseq=1 ; yseq<=48 ; ++yseq));
  do
  rm -f OUTPUT_NDR_$xseq ;
  (. NDR.sh FB$xseq FB$yseq ) > OUTPUT_NDR_$xseq ;
  RESULT_NDR=`cat OUTPUT_NDR_$xseq | grep "NDR" | awk '{ print $2;}'`;
  echo "$RESULT_NDR" >> VECTOR_NDR_$xseq ;
  done
