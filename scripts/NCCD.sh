#!/bin/bash
csize="40";
GECO_IND_PARAM=" -tm 1:1:0:0/0 -tm 4:1:0:0/0 -tm 6:1:0:0/0 -tm 11:10:0:0/0 -tm 14:50:1:0/0 -tm 19:50:1:3/10 -c $csize -g 0.88 ";
GECO_COND_PARAM=" -rm 13:100:1:0/0 -rm 20:1000:1:1/100 -tm 4:1:0:0/0 -tm 14:50:1:0/0 -tm 19:50:1:3/10 -c $csize -g 0.88 ";
rm -f REPORTx REPORTy;
echo "Running C(x) ...";
(./GeCo $GECO_IND_PARAM $1 ) > REPORTx;
echo "Done!";
echo "Running C(y) ...";
(./GeCo $GECO_IND_PARAM $2 ) > REPORTy;
echo "Done!";
Cx=`cat REPORTx | grep "Total bytes" | awk '{print $3;}'`;
Cy=`cat REPORTy | grep "Total bytes" | awk '{print $3;}'`;
printf "C(x)=$Cx\n";
printf "C(y)=$Cy\n";
echo "Running direction ...";
if (( $Cx < $Cy )); 
then
  rm -f REPORTxy;
  (./GeCo $GECO_COND_PARAM -r $1 $2 ) > REPORTxy;
  Cxy=`cat REPORTxy | grep "Total bytes" | awk '{print $3;}'`;
  nccd=`echo "scale=6; $Cxy / $Cx" | bc -l`;
else
  rm -f REPORTyx;
  (./GeCo $GECO_COND_PARAM -r $2 $1 ) > REPORTyx;
  Cyx=`cat REPORTyx | grep "Total bytes" | awk '{print $3;}'`;
  nccd=`echo "scale=6; $Cyx / $Cy" | bc -l`;
fi
printf "\n";
printf "====================================================\n";
printf "NCCD: $nccd\n";
printf "====================================================\n";
