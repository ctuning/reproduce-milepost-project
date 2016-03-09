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

dep_cjson_i=CM_${CM_CODE_DEP_CJSON}_INCLUDE
dep_cjson_l=CM_${CM_CODE_DEP_CJSON}_LIB
dep_cjson_t=CM_${CM_CODE_DEP_CJSON}_TARGET
dep_openme_i=CM_${CM_CODE_DEP_OPENME}_INCLUDE
dep_openme_l=CM_${CM_CODE_DEP_OPENME}_LIB
dep_openme_t=CM_${CM_CODE_DEP_OPENME}_TARGET

r_dep_cjson_i=${!dep_cjson_i}
r_dep_cjson_l=${!dep_cjson_l}
r_dep_cjson_t=${!dep_cjson_t}
r_dep_openme_i=${!dep_openme_i}
r_dep_openme_l=${!dep_openme_l}
r_dep_openme_t=${!dep_openme_t}

export OPENME_INCLUDE_DIRS="${r_dep_cjson_i} ${r_dep_openme_i}"
export OPENME_LIBS="${r_dep_openme_l}/${r_dep_openme_t} ${r_dep_cjson_l}/${r_dep_cjson_t}"

export OPENME_INCLUDE_DIRS="/home/fursin/fggwork/cm/cm-repos/ctuning-setup/.cmr/code/39944f7490d535a1/include /home/fursin/fggwork/cm/cm-repos/ctuning-setup/.cmr/code/48e4bf1a6ecc36d8/include"
export OPENME_LIBS="/home/fursin/fggwork/cm/cm-repos/ctuning-setup/.cmr/code/48e4bf1a6ecc36d8/lib/libopenme.a /home/fursin/fggwork/cm/cm-repos/ctuning-setup/.cmr/code/39944f7490d535a1/lib/libcjson.a"

# We may need this for demos - since we need to use 32-bit compiled alchemist plugin
# on 64-bit machine, so we may need to do some manual tricks 
# (and compile plugin with -m32)
#echo $OPENME_INCLUDE_DIRS > _libs_openme.txt
#echo $OPENME_LIBS >> _libs_openme.txt

# Prepare
mkdir -p ${CM_INSTALL_OBJ_DIR}
mkdir -p ${CM_INSTALL_DIR}

if [ "${CM_PARALLEL_JOB_NUMBER}" != "" ] ; then
  pj="-j ${CM_PARALLEL_JOB_NUMBER}"
fi

if [ "${CM_SKIP_BUILD}" != "yes" ] ; then
 # Patch
 cd ${CM_LOCAL_SRC_DIR}
 patch -p0 < ../patch1
fi

# Configure
cd ${CM_INSTALL_OBJ_DIR}

if [ "${CM_SKIP_BUILD}" != "yes" ] ; then

 ${CM_LOCAL_SRC_DIR}/configure  ${CM_CONFIGURE_EXTRA_PARAMS} \
                              --prefix=${CM_INSTALL_DIR}
 if [ "${?}" != "0" ] ; then
   echo "Error: Configuration failed at $PWD!"
   exit 1
 fi

 # Make
 cd ${CM_INSTALL_OBJ_DIR}
 make $pj
  if [ "${?}" != "0" ] ; then
    echo "Error: Compilation failed at $PWD!" 
    exit 1
  fi

 make install $pj
  if [ "${?}" != "0" ] ; then
    echo "Error: Compilation failed at $PWD!" 
   exit 1
  fi

fi

# Hack? On FGG computer libexec is lib ...
cp -rf ${CM_INSTALL_DIR}/open64-gcc-4.2.0/lib ${CM_INSTALL_DIR}/open64-gcc-4.2.0/libexec

# Prepare environment
echo "" >> ${CM_CODE_ENV_FILE}
echo "# Environment variables" >> ${CM_CODE_ENV_FILE}
echo "export CM_${CM_CODE_UID}_INSTALL=${CM_INSTALL_DIR}" >> ${CM_CODE_ENV_FILE}
echo "export CM_${CM_CODE_UID}_BIN=\$CM_${CM_CODE_UID}_INSTALL/bin" >> ${CM_CODE_ENV_FILE}
echo "export CM_${CM_CODE_UID}_SRC=${CM_LOCAL_SRC_DIR}" >> ${CM_CODE_ENV_FILE}
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
echo "export CM_CXX=opencc" >> ${CM_CODE_ENV_FILE}
echo "export CM_OBJ_EXT=.o" >> ${CM_CODE_ENV_FILE}
echo "export CM_CC=opencc" >> ${CM_CODE_ENV_FILE}
echo "export CM_FC=openf90" >> ${CM_CODE_ENV_FILE}
echo "export CM_FC90=openf90" >> ${CM_CODE_ENV_FILE}
echo "export CM_FC95=openf95" >> ${CM_CODE_ENV_FILE}
echo "export CM_FLAGS_DLL=\"-shared -fPIC\"" >> ${CM_CODE_ENV_FILE}
echo "export CM_FLAGS_DLL_EXTRA=-ldl" >> ${CM_CODE_ENV_FILE}
echo "export CM_FLAGS_OUTPUT=-o " >> ${CM_CODE_ENV_FILE}
echo "export CM_DLL_EXT=.so" >> ${CM_CODE_ENV_FILE}
echo "export CM_LIB_EXT=.a" >> ${CM_CODE_ENV_FILE}
echo "export CM_FLAGS_CREATE_OBJ=-c" >> ${CM_CODE_ENV_FILE}
echo "export CM_LB=\"ar rcs\"" >> ${CM_CODE_ENV_FILE}
echo "export CM_AR=ar" >> ${CM_CODE_ENV_FILE}
echo "export CM_LB_OUTPUT=" >> ${CM_CODE_ENV_FILE}
echo "export CM_EXE_EXT=.out" >> ${CM_CODE_ENV_FILE}
echo "export CM_FLAGS_STATIC_BIN=\"-static -fPIC\"" >> ${CM_CODE_ENV_FILE}
echo "export CM_FLAGS_STATIC_LIB=\"-static -fPIC\"" >> ${CM_CODE_ENV_FILE}
echo "export CM_FLAGS_DYNAMIC_BIN=" >> ${CM_CODE_ENV_FILE}
echo "export CM_FLAGS_CREATE_ASM=-S" >> ${CM_CODE_ENV_FILE}
echo "export CM_ASM_EXT=.s" >> ${CM_CODE_ENV_FILE}
echo "export CM_LD_FLAGS_EXTRA=\"-lm -ldl\"" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "export CM_MAKE=make" >> ${CM_CODE_ENV_FILE%}
echo "export CM_OBJDUMP=\"objdump -d\"" >> ${CM_CODE_ENV_FILE}

chmod 755 ${CM_CODE_ENV_FILE}

# Cleaning directories if needed
echo ""
echo "Cleaning directories if needed ..."
echo ""

if [ "${CM_INSTALL_DELETE_SRC_DIR}" == "yes" ] ; then rm -rf ${CM_LOCAL_SRC_DIR}; fi
if [ "${CM_INSTALL_DELETE_OBJ_DIR}" == "yes" ] ; then rm -rf ${CM_INSTALL_OBJ_DIR}; fi
