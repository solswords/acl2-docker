#!/bin/bash
PREFIX=$1
BINDIR=$2
cd $PREFIX
wget https://www.labri.fr/perso/lsimon/downloads/softwares/glucose-syrup-4.1.tgz
tar xf glucose-syrup-4.1.tgz
rm ._glucose-syrup-4.1
cd glucose-syrup-4.1/simp
make rs
mv glucose_static $BINDIR/glucose
