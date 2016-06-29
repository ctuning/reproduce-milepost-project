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

#####################################################################
echo ""
echo "Cloning tool from '${CERE_URL}' ..."

git clone ${CERE_URL} ${INSTALL_DIR}/src
if [ "${?}" != "0" ] ; then
  echo "Error: Cloning from '${CERE_URL}' failed!"
  exit 1
fi
