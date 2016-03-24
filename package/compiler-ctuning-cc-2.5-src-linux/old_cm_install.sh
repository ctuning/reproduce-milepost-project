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

dep_milepost_gcc=${CM_CODE_DEP_MILEPOST_GCC}

if [ "${CM_SKIP_BUILD}" != "yes" ] ; then

 # Make
 curdir=$PWD
 cd ${CM_LOCAL_SRC_DIR}/ccc-framework/src-plat-dep/tools/ctuning-cc
 make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS}
 if [ "${?}" != "0" ] ; then
   echo "Error: Compilation failed at $PWD!" 
   exit 1
 fi
 make install DEST=${CM_INSTALL_DIR}
 if [ "${?}" != "0" ] ; then
   echo "Error: Compilation failed at $PWD!" 
   exit 1
 fi

 cd ${CM_LOCAL_SRC_DIR}/ccc-framework/src-plat-dep/plugins/ml/ccc-ml-accumulate-features
 make MISCOPT=${CM_COMPILER_FLAGS_CC_OPTS}
 if [ "${?}" != "0" ] ; then
   echo "Error: Compilation failed at $PWD!" 
   exit 1
 fi
 make install DEST=${CM_INSTALL_DIR}
 if [ "${?}" != "0" ] ; then
   echo "Error: Compilation failed at $PWD!" 
   exit 1
 fi

 cp -rf ${CM_LOCAL_SRC_DIR}/ccc-framework/src-plat-indep ${CM_INSTALL_DIR}/src-plat-indep

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
echo "export CCC_ROOT=\$CM_${CM_CODE_UID}_INSTALL" >> ${CM_CODE_ENV_FILE}
echo "export CCC_PLUGINS=\$CCC_ROOT/src-plat-indep/" >> ${CM_CODE_ENV_FILE}
echo "export PATH=\$CCC_ROOT/src-plat-indep/plugins:\$PATH" >> ${CM_CODE_ENV_FILE}
echo "export CCC_UUID=uuidgen" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#set MILEPOST compiler names (in the future it may be some other compiler" >> ${CM_CODE_ENV_FILE}
echo "#that supports ICI and plugins)" >> ${CM_CODE_ENV_FILE}
echo "dep_milepost_gcc=\${CM_CODE_DEP_MILEPOST_GCC}" >> ${CM_CODE_ENV_FILE}
echo "dep_milepost_gcc_i=CM_\${dep_milepost_gcc}_INSTALL" >> ${CM_CODE_ENV_FILE}

echo "export CTUNING_ANALYSIS_CC=\${!dep_milepost_gcc_i}/bin/gcc" >> ${CM_CODE_ENV_FILE}
echo "export CTUNING_ANALYSIS_CPP=\${!dep_milepost_gcc}/bin/g++" >> ${CM_CODE_ENV_FILE}
echo "export CTUNING_ANALYSIS_FORTRAN=\${!dep_milepost_gcc}/bin/gfortran" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "export CTUNING_COMPILER_CC=\$CM_CC" >> ${CM_CODE_ENV_FILE}
echo "export CTUNING_COMPILER_CPP=\$CM_CXX" >> ${CM_CODE_ENV_FILE}
echo "export CTUNING_COMPILER_FORTRAN=\$CM_FC" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "export CM_CXX=ctuning-c++" >> ${CM_CODE_ENV_FILE}
echo "export CM_OBJ_EXT=.o" >> ${CM_CODE_ENV_FILE}
echo "export CM_CC=ctuning-cc" >> ${CM_CODE_ENV_FILE}
echo "export CM_FC=ctuning-fortran" >> ${CM_CODE_ENV_FILE}
echo "export CM_F90=ctuning-fortran" >> ${CM_CODE_ENV_FILE}
echo "export CM_F95=ctuning-fortran" >> ${CM_CODE_ENV_FILE}
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

echo "" >> ${CM_CODE_ENV_FILE}
echo "# PRESET SOME DEFAULT VARIABLES" >> ${CM_CODE_ENV_FILE}
echo "export ICI_PROG_FEAT_PASS=fre" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#set cTuning web-service parameters" >> ${CM_CODE_ENV_FILE}
echo "export CCC_CTS_URL=cTuning.org/wiki/index.php/Special:CDatabase?request=" >> ${CM_CODE_ENV_FILE}
echo "#export CCC_CTS_URL=localhost/cTuning/wiki/index.php/Special:CDatabase?request=" >> ${CM_CODE_ENV_FILE}
echo "export CCC_CTS_DB=fursinne_coptcases" >> ${CM_CODE_ENV_FILE}
echo "#set cTuning username (self-register at http://cTuning.org/wiki/index.php/Special:UserLogin)" >> ${CM_CODE_ENV_FILE}
echo "export CCC_CTS_USER=gfursin" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#compiler which was used to extract features for all programs to keep at cTuning.org" >> ${CM_CODE_ENV_FILE}
echo "#do not change it unless you understand what you do ;) ..." >> ${CM_CODE_ENV_FILE}
echo "export CCC_COMPILER_FEATURES_ID=129504539516446542" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#use architecture flags from cTuning" >> ${CM_CODE_ENV_FILE}
echo "export CCC_OPT_ARCH_USE=0" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#retrieve opt cases only when execution time > TIME_THRESHOLD" >> ${CM_CODE_ENV_FILE}
echo "export TIME_THRESHOLD=0.3" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#retrieve opt cases only with specific notes" >> ${CM_CODE_ENV_FILE}
echo "#export NOTES=" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#retrieve opt cases only when profile info is !=""" >> ${CM_CODE_ENV_FILE}
echo "#export PG_USE=1" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#retrieve opt cases only when execution output is correct (or not if =0)" >> ${CM_CODE_ENV_FILE}
echo "export OUTPUT_CORRECT=1" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#check user or total execution time" >> ${CM_CODE_ENV_FILE}
echo "#export RUN_TIME=RUN_TIME_USER" >> ${CM_CODE_ENV_FILE}
echo "export RUN_TIME=RUN_TIME" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#Sort optimization case by speedup (0 - ex. time, 1 - code size, 2 - comp time)" >> ${CM_CODE_ENV_FILE}
echo "export SORT=012" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#produce additional optimization report including optimization space froniters" >> ${CM_CODE_ENV_FILE}
echo "export CT_OPT_REPORT=1" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#Produce optimization space frontier" >> ${CM_CODE_ENV_FILE}
echo "#export DIM=01 (2D frontier)" >> ${CM_CODE_ENV_FILE}
echo "#export DIM=02 (2D frontier)" >> ${CM_CODE_ENV_FILE}
echo "#export DIM=12 (2D frontier)" >> ${CM_CODE_ENV_FILE}
echo "#export DIM=012 (3D frontier)" >> ${CM_CODE_ENV_FILE}
echo "#export DIM=012" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#Cut cases when producing frontier (select cases when speedup 0,1 or 2 is more than some threshold)" >> ${CM_CODE_ENV_FILE}
echo "#export CUT=0,0,1.2" >> ${CM_CODE_ENV_FILE}
echo "#export CUT=1,0.80,1" >> ${CM_CODE_ENV_FILE}
echo "#export CUT=0,0,1" >> ${CM_CODE_ENV_FILE}

echo "" >> ${CM_CODE_ENV_FILE}
echo "#find similar cases from the following platform" >> ${CM_CODE_ENV_FILE}
echo "export CCC_PLATFORM_ID=2111574609159278179" >> ${CM_CODE_ENV_FILE}
echo "export CCC_ENVIRONMENT_ID=2781195477254972989" >> ${CM_CODE_ENV_FILE}
echo "export CCC_COMPILER_ID=331350613878705696" >> ${CM_CODE_ENV_FILE}

chmod 755 ${CM_CODE_ENV_FILE}

# Cleaning directories if needed
echo ""
echo "Cleaning directories if needed ..."
echo ""

if [ "${CM_INSTALL_DELETE_SRC_DIR}" == "yes" ] ; then rm -rf ${CM_LOCAL_SRC_DIR}; fi
if [ "${CM_INSTALL_DELETE_OBJ_DIR}" == "yes" ] ; then rm -rf ${CM_INSTALL_OBJ_DIR}; fi
