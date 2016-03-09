#! /bin/bash

FGG experienced problem compiling this package with newer texinfo version >= 5.0

Hence set path to old texinfo here before installing this package:
export PATH=~/fggprogs/texinfo-4.13/bin:$PATH

ck install package
