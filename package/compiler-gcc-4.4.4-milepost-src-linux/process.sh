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

export PACKAGE_NAME=milepost-gcc-4.4.4

#
echo ""
echo "Copying package files ..."

cd ${INSTALL_DIR}
cp ${PACKAGE_DIR}/${PACKAGE_NAME}.tar.bz2 .
bzip2 -d ${PACKAGE_NAME}.tar.bz2
tar xvf ${PACKAGE_NAME}.tar
rm ${PACKAGE_NAME}.tar

export INSTALL_OBJ_DIR=${INSTALL_DIR}/obj
mkdir $INSTALL_OBJ_DIR

#
echo ""
echo "Configuring ..."

if ["$LIBRARY_PATH" -eq ""]
then
 export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
else
 export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH
fi

cd ${INSTALL_OBJ_DIR}
#../${PACKAGE_NAME}/configure --prefix=${INSTALL_DIR} \
#                             --with-gmp=${CK_ENV_LIB_GMP} \
#                             --with-mpfr=${CK_ENV_LIB_MPFR} \
#                             --with-mpc=${CK_ENV_LIB_MPC} \
#                             --disable-multilib

# FGG had issues with 'cannot find crti.o: No such file or directory',
# hence FGG added export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH 

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
