#!/bin/bash
echo Enter the interplanar distance in Angstrom
read D
echo Enter the first atom index for aligning the x axis
read J
echo Enter the second atom index for aligning the x axis
read K
echo Enter the x axis displacement in Angstrom
read F
echo Enter the y axis displacement in Angstrom
read G
echo MolPLACER running, please wait..........

echo $D,$F,$G,$J,$K,$F,$G > input.csv

wc -l mol.xyz >> coor.txt 

B=$(awk '{print $1}' coor.txt)

awk 'NR == 3, NR == '$B'{print $0}' mol.xyz >> mona1.txt
awk '$2+=0.000001' mona1.txt >> monax.txt
awk '$3+=0.000001' monax.txt >> monay.txt
awk '$4+=0.000001' monay.txt >> mona.txt

awk '{print $1}' mona.txt >> mona.csv 
awk '{print $2}' mona.txt >> xa1.csv
awk '{print $3}' mona.txt >> ya1.csv
awk '{print $4}' mona.txt >> za1.csv

paste -d, mona.csv xa1.csv ya1.csv za1.csv > comba.csv

paste -d, xa1.csv ya1.csv za1.csv > pvec.csv

#vector calculations
python3 vect.py

echo Calculating cross product

cat cross.csv > cross.txt 

cat cross.txt | tr ',' '     ' > crossf1.txt

q=$(awk '{print $1}' crossf1.txt)
w=$(awk '{print $2}' crossf1.txt)
e=$(awk '{print $3}' crossf1.txt)
tx=$(awk '{print $4}' crossf1.txt)
ty=$(awk '{print $5}' crossf1.txt)
tz=$(awk '{print $6}' crossf1.txt)
ux=$(awk '{print $7}' crossf1.txt)
uy=$(awk '{print $8}' crossf1.txt)
uz=$(awk '{print $9}' crossf1.txt)

echo $q
echo $w
echo $e

awk '$1+='$q'' xa1.csv >> xba.csv
awk '$1+='$w'' ya1.csv >> yba.csv
awk '$1+='$e'' za1.csv >> zba.csv

awk '$1+='$tx'' xba.csv >> xbb.csv
awk '$1+='$ty'' yba.csv >> ybb.csv
awk '$1+='$tz'' zba.csv >> zbb.csv

awk '$1+='$ux'' xbb.csv >> xb.csv
awk '$1+='$uy'' ybb.csv >> yb.csv
awk '$1+='$uz'' zbb.csv >> zb.csv

paste -d, mona.csv xb.csv yb.csv zb.csv > combb.csv

cat comba.csv combb.csv > final.csv

awk '{print $1 "	" $2 "	" $3 "	" $4}' final.csv >> final.xyz

cat final.xyz | tr ',' '    ' > fixed.xyz

rm *.csv *.txt final.xyz

echo Thankyou for using MolPLACER.......