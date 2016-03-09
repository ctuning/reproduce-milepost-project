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

export PACKAGE_NAME=open64-5.0

cd ${INSTALL_DIR}
cp ${PACKAGE_DIR}/${PACKAGE_NAME}.tar.bz2 .
bzip2 -d ${PACKAGE_NAME}.tar.bz2
tar xvf ${PACKAGE_NAME}.tar
rm ${PACKAGE_NAME}.tar

export INSTALL_OBJ_DIR=${INSTALL_DIR}/obj
mkdir $INSTALL_OBJ_DIR

# Patching
echo ""
echo "Patching ..."
cd ${INSTALL_DIR}${PACKAGE_NAME}
patch -p0 < ../patch1

#
echo ""
echo "Configuring ..."

cd ${INSTALL_OBJ_DIR}
../${PACKAGE_NAME}/configure --prefix=${INSTALL_DIR}

if [ "${?}" != "0" ] ; then
  echo "Error: Configuration failed in $PWD!"
  exit 1
fi

# Build
echo ""
echo "Building ..."
echo ""
cd ${INSTALL_OBJ_DIR}
make
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

# Hack? On some machines libexec is lib ...
cp -rf ${INSTALL_DIR}/open64-gcc-4.2.0/lib ${INSTALL_DIR}/open64-gcc-4.2.0/libexec
