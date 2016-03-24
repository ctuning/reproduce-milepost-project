#!/bin/bash

#
# Installation script for cM packages.
# Part of Collective Mind Infrastructure (cM).
#
# See cM LICENSE.txt for licensing details.
# See cM Copyright.txt for copyright details.
#
# Developer(s): Grigori Fursin, started on 2011.09
#

# ${CM_LOCAL_SRC_DIR}  - src directory
# ${CM_INSTALL_OBJ_DIR}  - obj directory
# ${CM_INSTALL_DIR}  - install dir
# ${CM_CODE_ENV_FILE}  - file that sets environment
# ${CM_CODE_UID}  - cM code UID
# ${CM_PROCESSOR_BITS}  - number of bits for the OS (32 or 64)
# ${CM_OS_LIB_DIR} - lib extension for this OS
# ${CM_PARALLEL_JOB_NUMBER} - parallel jobs if supported

# Misc vars
ICI2_PLUGIN_VER=gcc-plugin-ici2

# Prepare
mkdir -p ${CM_INSTALL_DIR}

if [ "${CM_PARALLEL_JOB_NUMBER}" != "" ] ; then
  pj="-j ${CM_PARALLEL_JOB_NUMBER}"
fi

dep_xsb=${CM_CODE_DEP_XSB}
dep_milepost_gcc=${CM_CODE_DEP_MILEPOST_GCC}

dep_milepost_gcc_s=CM_${dep_milepost_gcc}_SRC

if [ "${CM_SKIP_BUILD}" != "yes" ] ; then

# Make
cd ${CM_LOCAL_SRC_DIR}/src/extract-program-structure
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS} EXTRAINCLUDE=-I${!dep_milepost_gcc_s} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${CM_INSTALL_DIR}/${CM_OS_LIB_DIR} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

cd ${CM_LOCAL_SRC_DIR}/src/save-executed-passes
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS} EXTRAINCLUDE=-I${!dep_milepost_gcc_s} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${CM_INSTALL_DIR}/${CM_OS_LIB_DIR} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

cd ${CM_LOCAL_SRC_DIR}/src/substitute-passes
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS} EXTRAINCLUDE=-I${!dep_milepost_gcc_s} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${CM_INSTALL_DIR}/${CM_OS_LIB_DIR} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

cd ${CM_LOCAL_SRC_DIR}/src/extract-program-static-features
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS} EXTRAINCLUDE=-I${!dep_milepost_gcc_s} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${CM_INSTALL_DIR}/${CM_OS_LIB_DIR} ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

cd ${CM_LOCAL_SRC_DIR}/src/extract-program-static-features/ml-feat-proc
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make XSB_DIR=$XSB_DIR XSB_DIR_ADD=$XSB_DIR_ADD ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make install INSTALL_DIR=${CM_INSTALL_DIR}/bin ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi
make clean ICI_PLUGIN_VER=$ICI2_PLUGIN_VER
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!" 
   exit 1
 fi

fi

# Prepare environment
echo "" >> ${CM_CODE_ENV_FILE}
echo "# Environment variables" >> ${CM_CODE_ENV_FILE}
echo "export CM_${CM_CODE_UID}_INSTALL=${CM_INSTALL_DIR}" >> ${CM_CODE_ENV_FILE}
echo "export CM_${CM_CODE_UID}_BIN=\$CM_${CM_CODE_UID}_INSTALL/bin" >> ${CM_CODE_ENV_FILE}
echo "export CM_${CM_CODE_UID}_LIB=\$CM_${CM_CODE_UID}_INSTALL/${CM_OS_LIB_DIR}" >> ${CM_CODE_ENV_FILE}
if [ "${CM_PROCESSOR_BITS}" == "64" ] ; then
  echo "export CM_${CM_CODE_UID}_LIBS=\$CM_${CM_CODE_UID}_INSTALL/${CM_OS_LIB_DIR}:\$CM_${CM_CODE_UID}_INSTALL/lib" >> ${CM_CODE_ENV_FILE}
else
  echo "export CM_${CM_CODE_UID}_LIBS=\$CM_${CM_CODE_UID}_INSTALL/${CM_OS_LIB_DIR}" >> ${CM_CODE_ENV_FILE}
fi
echo "export CM_${CM_CODE_UID}_INCLUDE=\$CM_${CM_CODE_UID}_INSTALL/include" >> ${CM_CODE_ENV_FILE}
echo "" >> ${CM_CODE_ENV_FILE}
echo "export PATH=\$CM_${CM_CODE_UID}_BIN:\$PATH" >> ${CM_CODE_ENV_FILE}
echo "export LD_LIBRARY_PATH=\$CM_${CM_CODE_UID}_LIB:\$LD_LIBRARY_PATH" >> ${CM_CODE_ENV_FILE}
echo "" >> ${CM_CODE_ENV_FILE}
echo "export ICI2_PLUGIN_VER=$ICI2_PLUGIN_VER" >> ${CM_CODE_ENV_FILE}
echo "export ICI_LIB=\$CM_${CM_CODE_UID}_LIB" >> ${CM_CODE_ENV_FILE}
echo "export ICI_PLUGIN_VER=\$ICI2_PLUGIN_VER" >> ${CM_CODE_ENV_FILE}
echo "export CCC_ICI_USE=ICI_USE" >> ${CM_CODE_ENV_FILE}
echo "export CCC_ICI_PLUGINS=ICI_PLUGIN" >> ${CM_CODE_ENV_FILE}
echo "export CCC_ICI_PASSES_FN=ici_passes_function" >> ${CM_CODE_ENV_FILE}
echo "export CCC_ICI_PASSES_EXT=.txt" >> ${CM_CODE_ENV_FILE}
echo "export CCC_ICI_PASSES_RECORD_PLUGIN=\$ICI_LIB/\$ICI_PLUGIN_VER-extract-program-structure.so" >> ${CM_CODE_ENV_FILE}
echo "export CCC_ICI_FEATURES_ST_FN=ici_features_function" >> ${CM_CODE_ENV_FILE}
echo "export CCC_ICI_FEATURES_ST_EXT=.ft" >> ${CM_CODE_ENV_FILE}
echo "export CCC_ICI_FEATURES_ST_EXTRACT_PLUGIN=\$ICI_LIB/\$ICI_PLUGIN_VER-extract-program-static-features.so" >> ${CM_CODE_ENV_FILE}
echo "export ICI_PROG_FEAT_PASS=fre" >> ${CM_CODE_ENV_FILE}
echo "export ML_ST_FEAT_TOOL=\$CM_${CM_CODE_UID}_BIN/featlstn.P" >> ${CM_CODE_ENV_FILE}
echo "export ICI_PROG_FEAT_EXT_TOOL=\$CM_${CM_CODE_UID}_BIN/ml-feat-proc" >> ${CM_CODE_ENV_FILE}
chmod 755 ${CM_CODE_ENV_FILE}

# Cleaning directories if needed
echo ""
echo "Cleaning directories if needed ..."
echo ""

if [ "${CM_INSTALL_DELETE_SRC_DIR}" == "yes" ] ; then rm -rf ${CM_LOCAL_SRC_DIR}; fi
if [ "${CM_INSTALL_DELETE_OBJ_DIR}" == "yes" ] ; then rm -rf ${CM_INSTALL_OBJ_DIR}; fi
