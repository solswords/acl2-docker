#!/bin/bash
PREFIX=$1
BINDIR=$2
SCRIPTDIR=$3
cd $PREFIX
git clone --depth 1 https://github.com/Clozure/ccl ccl
cd ccl
wget https://github.com/Clozure/ccl/releases/download/v1.12-dev.5/linuxx86.tar.gz
tar xzf linuxx86.tar.gz
rm linuxx86.tar.gz
rm lx86cl.image
cd lisp-kernel/linuxx8664
make clean
make
cd ../..
echo '(ccl:rebuild-ccl :clean t) (quit)' | ./lx86cl64
cp $SCRIPTDIR/ccl.sh .
ln -s $PREFIX/ccl/ccl.sh $BINDIR/ccl
