#!/bin/bash
PREFIX=$1
LIBDIR=$2
PATCHDIR=$3
cd $PREFIX
mkdir glucose-tmp
cd glucose-tmp
wget https://baldur.iti.kit.edu/sat-competition-2017/solvers/incremental/glucose-ipasir.zip
unzip glucose-ipasir.zip
cd ..
mv glucose-tmp/sat/glucose4 glucose-ipasir
rm -rf glucose-tmp
cd glucose-ipasir
cp $PATCHDIR/glucose-ipasir-patch .
patch makefile glucose-ipasir-patch
make
g++ -shared -Wl,-soname,libipasirglucose4.so -o libipasirglucose4.so ipasirglucoseglue.o libipasirglucose4.a
mv libipasirglucose4.so $LIBDIR
