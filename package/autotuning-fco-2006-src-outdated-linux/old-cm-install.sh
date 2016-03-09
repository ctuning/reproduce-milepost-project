#!/bin/bash

#
# Installation script for "comp" tools.
# Part of Collective Mind Infrastructure (cM).
#
# See cM LICENSE.txt for licensing details.
# See cM Copyright.txt for copyright details.
#
# Developer(s): Grigori Fursin, started on 2011.09
#

NAME=fco
CM_UID=09eb795d828df1bd

# Prepare
CUR_DIR=$PWD
mkdir -p $CM_PKG_BUILD_DIR
CM_PKG_BUILD_DIRX=$CM_PKG_BUILD_DIR/cm-$CM_UID
mkdir -p $CM_PKG_BUILD_DIRX
CM_PKG_INSTALL=$CM_PKG_COMMON_INSTALL/cm-$CM_UID
mkdir -p $CM_PKG_COMMON_INSTALL/bin

# Copy 
mkdir -p $CM_PKG_INSTALL
cd $CM_PKG_INSTALL
cp $CUR_DIR/*.bz2 .
cp $CUR_DIR/*.gz .

# Extract
rm -f *.tar
bzip2 -d *.bz2
gzip -d *.gz
tar xvf $NAME.tar
rm -f *.tar
cd $NAME
mv * ../
cd ..

# Prepare environment
CM_ENV=$CM_PKG_COMMON_INSTALL/bin/cm_env_$CM_UID.sh
echo "#/bin/sh" > $CM_ENV
echo "" >> $CM_ENV
echo "export CM_${CM_UID}_INSTALL=$CM_PKG_INSTALL" >> $CM_ENV
echo "export CM_${CM_UID}_BIN=\$CM_${CM_UID}_INSTALL/bin" >> $CM_ENV
echo "export CM_${CM_UID}_LIB=\$CM_${CM_UID}_INSTALL/lib" >> $CM_ENV
echo "export CM_${CM_UID}_INCLUDE=\$CM_${CM_UID}_INSTALL/include" >> $CM_ENV
echo "" >> $CM_ENV
echo "export PATH=\$CM_${CM_UID}_BIN:\$PATH" >> $CM_ENV
echo "export LD_LIBRARY_PATH=\$CM_${CM_UID}_LIB:\$LD_LIBRARY_PATH" >> $CM_ENV

chmod 755 $CM_ENV
