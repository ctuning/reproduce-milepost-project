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

export PACKAGE_NAME=gmp-5.0.2

cd ${INSTALL_DIR}
cp ${PACKAGE_DIR}/${PACKAGE_NAME}.tar.gz .
gzip -d ${PACKAGE_NAME}.tar.gz
tar xvf ${PACKAGE_NAME}.tar
rm ${PACKAGE_NAME}.tar

export INSTALL_OBJ_DIR=${INSTALL_DIR}/obj
mkdir $INSTALL_OBJ_DIR

 echo ""
 cd ${INSTALL_OBJ_DIR}
 ../${PACKAGE_NAME}/configure --prefix=${INSTALL_DIR} --enable-cxx
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed in $PWD!"
   exit 1
 fi

 # Build
 echo ""
 echo "Building ..."
 echo ""
 cd ${INSTALL_OBJ_DIR}
 make $pj
  if [ "${?}" != "0" ] ; then
    echo "Error: Compilation failed in $PWD!" 
    exit 1
  fi

 # Install
 echo ""
 echo "Installing ..."
 echo ""

 make install
  if [ "${?}" != "0" ] ; then
    echo "Error: Compilation failed in $PWD!" 
    exit 1
  fi

