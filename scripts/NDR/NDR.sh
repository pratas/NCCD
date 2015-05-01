#!/bin/bash
csize="45";
GECO_NDR_PARAM=" -rm 6:10:0:0/0 -rm 10:50:0:0/0 -rm 14:200:1:0/0 -rm 18:1000:1:3/100 -c $csize -g 0.88 ";
rm -f REPORT-$1-$2;
echo "Running C(x||y) ...";
(./GeCo $GECO_NDR_PARAM -r $1 $2 ) > REPORT-$1-$2 ;
ndr=`cat REPORT-$1-$2 | grep "Total bytes" | awk '{print $11;}'`;
echo "Done!";
printf "\n";
printf "====================================================\n";
printf "NDR: $ndr\n";
printf "====================================================\n";
