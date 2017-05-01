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

export PACKAGE_NAME=ctuning-cc-2.5-plugins
export ICI2_PLUGIN_VER=gcc-plugin-ici2
export CM_COMPILER_FLAGS_CC_OPTS=-O2

#
echo ""
echo "Copying package files ..."

cd ${INSTALL_DIR}
cp ${PACKAGE_DIR}/${PACKAGE_NAME}.tar.bz2 .
bzip2 -d ${PACKAGE_NAME}.tar.bz2
tar xvf ${PACKAGE_NAME}.tar
rm ${PACKAGE_NAME}.tar

#
echo ""
echo "Configuring ..."

mkdir bin
mkdir lib

#############################################################################
echo ""
echo "Compiling extract-program-structure MILEPOST/cTuning plugin ..."

cd ${INSTALL_DIR}/${PACKAGE_NAME}/src/extract-program-structure
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS} EXTRAINCLUDE=-I${CK_ENV_COMPILER_GCC_SRC} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${INSTALL_DIR}/lib ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

#############################################################################
echo ""
echo "Compiling save-executed-passes MILEPOST/cTuning plugin ..."

cd ${INSTALL_DIR}/${PACKAGE_NAME}/src/save-executed-passes
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS} EXTRAINCLUDE=-I${CK_ENV_COMPILER_GCC_SRC} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${INSTALL_DIR}/lib ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

#############################################################################
echo ""
echo "Compiling substitute-passes MILEPOST/cTuning plugin ..."

cd ${INSTALL_DIR}/${PACKAGE_NAME}/src/substitute-passes
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS} EXTRAINCLUDE=-I${CK_ENV_COMPILER_GCC_SRC} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${INSTALL_DIR}/lib ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

#############################################################################
echo ""
echo "Compiling extract-program-static-features MILEPOST/cTuning plugin ..."

cd ${INSTALL_DIR}/${PACKAGE_NAME}/src/extract-program-static-features
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS} EXTRAINCLUDE=-I${CK_ENV_COMPILER_GCC_SRC} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${INSTALL_DIR}/lib ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

#############################################################################
echo ""
echo "Compiling extract-program-static-features MILEPOST/cTuning aux tool ..."

cd ${INSTALL_DIR}/${PACKAGE_NAME}/src/extract-program-static-features/ml-feat-proc
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make XSB_DIR=${CK_ENV_COMPILER_PROLOG} XSB_DIR_ADD=$XSB_DIR_ADD ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${INSTALL_DIR}/bin ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

