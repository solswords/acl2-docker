#!/bin/bash
PREFIX=$1
BINDIR=$2
cd $PREFIX
git clone --depth 1 https://github.com/acl2/acl2 acl2
cd acl2
make LISP=ccl
ln -s `pwd`/saved_acl2 $BINDIR/acl2
