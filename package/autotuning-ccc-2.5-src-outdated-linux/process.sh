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

export PACKAGE_NAME=CCC-2.5-with-ml-plugins

cd ${INSTALL_DIR}
cp ${PACKAGE_DIR}/${PACKAGE_NAME}.tar.gz .
gzip -d ${PACKAGE_NAME}.tar.gz
tar xvf ${PACKAGE_NAME}.tar
rm ${PACKAGE_NAME}.tar

#
echo ""
echo "Configuring and installing..."

cd ${INSTALL_DIR}

. ./INSTALL.sh

if [ "${?}" != "0" ] ; then
  echo "Error: Installation failed in $PWD!" 
  exit 1
fi
