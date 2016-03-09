#! /bin/bash

# FGG experienced various problems compiling this package with GCC version >= 4.7.
# Hence here is possibility to compile this package using previous GCC version
# installed via CK ...

ck set env tags=compiler,gcc,v4.4.4,target-os-linux-64 bat_file=tmp-ck-env.sh --bat_new --print && . ./tmp-ck-env.sh || exit 1
export CC=${CK_CC} ; ck install package
