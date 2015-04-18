#!/bin/bash
csize="40";
GECO_NDR_PARAM=" -rm 4:1:0:0/0 -rm 14:100:1:0/0 -rm 20:1000:1:1/200 -c $csize -g 0.88 ";
rm -f REPORT;
echo "Running C(x||y) ...";
(./GeCo $GECO_NDR_PARAM -r $1 $2 ) > REPORT;
ndr=`cat REPORT | grep "Total bytes" | awk '{print $11;}'`;
echo "Done!";
printf "\n";
printf "====================================================\n";
printf "NDR: $ndr\n";
printf "====================================================\n";
