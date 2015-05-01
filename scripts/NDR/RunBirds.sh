#!/bin/bash
for((index=1; index<=6; ++index));
  do
  # cp ../data/FB$index .
  . RunBirdsNDR.sh $index &
  done
