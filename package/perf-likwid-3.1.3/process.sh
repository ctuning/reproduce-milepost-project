#! /bin/bash

#
# Installation script for CK packages.
#
# See CK LICENSE.txt for licensing details.
# See CK Copyright.txt for copyright details.
#
# Developer(s): Grigori Fursin, 2015
#

# PACKAGE_DIR
# INSTALL_DIR

export PACKAGE_NAME=likwid-3.1.3

cd ${INSTALL_DIR}
cp ${PACKAGE_DIR}/${PACKAGE_NAME}.tar.gz .
gzip -d ${PACKAGE_NAME}.tar.gz
tar xvf ${PACKAGE_NAME}.tar
rm ${PACKAGE_NAME}.tar

# Build
echo ""
echo "Building ..."
echo ""
cd ${INSTALL_DIR}/${PACKAGE_NAME}
make $pj
 if [ "${?}" != "0" ] ; then
  echo "Error: Compilation failed in $PWD!" 
  exit 1
 fi

# Install
echo ""
echo "Installing ..."
echo ""

make install PREFIX=${INSTALL_DIR} MANPREFIX=${INSTALL_DIR} LIKWIDFILTERPATH=${INSTALL_DIR}
if [ "${?}" != "0" ] ; then
 echo "Error: Compilation failed in $PWD!" 
 exit 1
fi

