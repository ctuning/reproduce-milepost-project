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

# Fix number of processes
NP=${CK_HOST_CPU_NUMBER_OF_PROCESSORS}
if [ "${PARALLEL_BUILDS}" != "" ] ; then
  NP=${PARALLEL_BUILDS}
fi

# GCC version
GCC_VER=`gcc -dumpversion`

# MACHINE 
MACHINE=`gcc -dumpmachine`

export PACKAGE_NAME=milepost-gcc-4.4.4

cd ${INSTALL_DIR}

# Set special vars
if [ "$LD_LIBRARY_PATH" == "" ] ; then
 export LD_LIBRARY_PATH=/usr/lib/${MACHINE}:/usr/lib/gcc/${MACHINE}/${GCC_VER}
else
 LD_LIBRARY_PATH1=${LD_LIBRARY_PATH}
 if [ "${LD_LIBRARY_PATH: -1}" == ":" ] ; then
   LD_LIBRARY_PATH1=${LD_LIBRARY_PATH: : -1}
 fi
 export LD_LIBRARY_PATH=$LD_LIBRARY_PATH1:/usr/lib/${MACHINE}:/usr/lib/gcc/${MACHINE}/${GCC_VER}
fi

if [ "$LIBRARY_PATH" == "" ] ; then
 export LIBRARY_PATH=/usr/lib/${MACHINE}:/usr/lib/gcc/${MACHINE}/${GCC_VER}
else
 LIBRARY_PATH1=${LIBRARY_PATH}
 if [ "${LIBRARY_PATH: -1}" == ":" ] ; then
   LIBRARY_PATH1=${LIBRARY_PATH: : -1}
 fi
 export LIBRARY_PATH=$LIBRARY_PATH1:/usr/lib/${MACHINE}:/usr/lib/gcc/${MACHINE}/${GCC_VER}
fi

echo ""
echo "Copying package files ..."

cp ${PACKAGE_DIR}/${PACKAGE_NAME}.tar.bz2 .
bzip2 -d ${PACKAGE_NAME}.tar.bz2
tar xvf ${PACKAGE_NAME}.tar
rm ${PACKAGE_NAME}.tar

rm -rf obj

export INSTALL_OBJ_DIR=${INSTALL_DIR}/obj
mkdir $INSTALL_OBJ_DIR

# 
echo ""
echo "Patching to support GCC v5+ ..."

cd ${INSTALL_DIR}/${PACKAGE_NAME}
patch -p2 < ${PACKAGE_DIR}/patch1

#
echo ""
echo "Configuring ..."

# Needed for host GCC 5+
export CFLAGS="-fgnu89-inline"

MACHINE=$(uname -m)
EXTRA_CFG=""
if [ "${MACHINE}" == "armv7l" ] || [ "${MACHINE}" == "aarch64" ] ; then
 EXTRA_CFG=" --enable-languages=c --disable-bootstrap \
 --disable-libssp \
 --with-newlib \
 --disable-libgomp \
 --disable-libmudflap \
 --disable-threads"
else
 EXTRA_CFG=" --enable-languages=c,fortran"
fi

cd ${INSTALL_OBJ_DIR}

../${PACKAGE_NAME}/configure --prefix=${INSTALL_DIR} ${EXTRA_CFG} \
                             --disable-multilib

#                             --with-gmp=${CK_ENV_LIB_GMP} \
#                             --with-mpfr=${CK_ENV_LIB_MPFR} \
#                             --with-mpc=${CK_ENV_LIB_MPC}

#                             CFLAGS="-fgnu89-inline"
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
make -j$NP
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
