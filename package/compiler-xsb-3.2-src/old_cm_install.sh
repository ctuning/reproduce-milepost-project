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

# Prepare
mkdir -p ${CM_INSTALL_DIR}

if [ "${CM_PARALLEL_JOB_NUMBER}" != "" ] ; then
  pj="-j ${CM_PARALLEL_JOB_NUMBER}"
fi

if [ "${CM_SKIP_BUILD}" != "yes" ] ; then

 # Make
 cd ${CM_LOCAL_SRC_DIR}/build
 make distclean
 ./configure ${CM_CONFIGURE_EXTRA_PARAMS} --prefix=${CM_INSTALL_DIR}
  if [ "${?}" != "0" ] ; then
    echo "Error: Configuration failed at $PWD!" 
    exit 1
  fi
 ./makexsb
  if [ "${?}" != "0" ] ; then
    echo "Error: Configuration failed at $PWD!" 
    exit 1
  fi
 ./makexsb install
  if [ "${?}" != "0" ] ; then
    echo "Error: Configuration failed at $PWD!" 
    exit 1
  fi

fi

# Prepare environment
echo "" >> ${CM_CODE_ENV_FILE}
echo "# Environment variables" >> ${CM_CODE_ENV_FILE}
echo "export CM_${CM_CODE_UID}_INSTALL=${CM_INSTALL_DIR}/3.2" >> ${CM_CODE_ENV_FILE}
echo "export XSB_DIR=\$CM_${CM_CODE_UID}_INSTALL" >> ${CM_CODE_ENV_FILE}
#Get installation dir for XSB (architecture related)
xsb_dir_add=$(ls ${CM_INSTALL_DIR}/3.2/config)
echo "export XSB_DIR_ADD=$xsb_dir_add" >> ${CM_CODE_ENV_FILE}
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

chmod 755 ${CM_CODE_ENV_FILE}

# Cleaning directories if needed
echo ""
echo "Cleaning directories if needed ..."
echo ""

if [ "${CM_INSTALL_DELETE_SRC_DIR}" == "yes" ] ; then rm -rf ${CM_LOCAL_SRC_DIR}; fi
if [ "${CM_INSTALL_DELETE_OBJ_DIR}" == "yes" ] ; then rm -rf ${CM_INSTALL_OBJ_DIR}; fi
