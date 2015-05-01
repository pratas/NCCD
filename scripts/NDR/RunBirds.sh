#!/bin/bash
for((index=1; index<=6; ++index));
  do
  . RunBirdsNDR.sh $index &
  done
