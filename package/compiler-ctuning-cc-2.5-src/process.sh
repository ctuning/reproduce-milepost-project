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

export PACKAGE_NAME=ctuning-cc-2.5
export PACKAGE_NAME1=${PACKAGE_NAME}.1
export CM_COMPILER_FLAGS_CC_OPTS=-O2

#
echo ""
echo "Copying package files ..."

cd ${INSTALL_DIR}
cp ${PACKAGE_DIR}/${PACKAGE_NAME1}.tar.gz .
gzip -d ${PACKAGE_NAME1}.tar.gz
tar xvf ${PACKAGE_NAME1}.tar
rm ${PACKAGE_NAME1}.tar

#
echo ""
echo "Configuring ..."

mkdir bin

#############################################################################
echo ""
echo "Compiling ctuning-cc ..."

cd ${INSTALL_DIR}/${PACKAGE_NAME}/ccc-framework/src-plat-dep/tools/ctuning-cc
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS}
if [ "${?}" != "0" ] ; then
  echo "Error: Compilation failed at $PWD!" 
  exit 1
fi
make install DEST=${INSTALL_DIR}
if [ "${?}" != "0" ] ; then
  echo "Error: Compilation failed at $PWD!" 
  exit 1
fi

#############################################################################
echo ""
echo "Compiling ccc-ml-accumulate-features ..."

cd ${CM_LOCAL_SRC_DIR}/ccc-framework/src-plat-dep/plugins/ml/ccc-ml-accumulate-features
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS}
if [ "${?}" != "0" ] ; then
  echo "Error: Compilation failed at $PWD!" 
  exit 1
fi
make install DEST=${INSTALL_DIR}
if [ "${?}" != "0" ] ; then
  echo "Error: Compilation failed at $PWD!" 
  exit 1
fi

cp -rf ${INSTALL_DIR}/${PACKAGE_NAME}/ccc-framework/src-plat-indep ${INSTALL_DIR}/src-plat-indep
