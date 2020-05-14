#!/bin/bash
cd /usr/local/src
git clone --depth 1 https://github.com/acl2/acl2 acl2
cd acl2
make LISP=ccl
ln -s `pwd`/saved_acl2 /usr/local/bin/acl2
