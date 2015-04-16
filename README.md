# NCCD

Programs to compute the NCCD (Normalized Conditional Compression Distance) and perform phylogenomics on 48 bird species.

## INSTALLATION ##

Simply run:
<pre>
wget https://github.com/pratas/NCCD/archive/master.zip
unzip master.zip
cd NCCD-master
</pre>

## EXECUTION

Make shore you have at least 200 GB of space in the hard drive.
Then, simply run:
<pre>
. run.sh
</pre>

It will download and install GeCo (https://github.com/pratas/geco/), although it might be needed to install cmake. Then, it will download all the the 48 bird sequences and run the NCCD.

For other purposes, such as a simple information distance between two sequences (fileA and fileB), go to scripts:
<pre>
cd scripts
</pre>
and run 
<pre>
. NCCD ../examples/fileA ../examples/fileB
</pre>
It will calculate the NCCD on two synthetic examples included in the system.

## ISSUES ##

For any issue let us know at [issues link](https://github.com/pratas/NCCD/issues).

## LICENSE ##

GPL v2.

For more information:
<pre>
http://www.gnu.org/licenses/gpl-2.0.html
</pre>

