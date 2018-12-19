Reproducing MILEPOST project using CK framework (machine learning based self-tuning compiler)
=============================================================================================

[![compatibility](https://github.com/ctuning/ck-guide-images/blob/master/ck-compatible.svg)](https://github.com/ctuning/ck)
[![automation](https://github.com/ctuning/ck-guide-images/blob/master/ck-artifact-automated-and-reusable.svg)](http://cTuning.org/ae)
[![workflow](https://github.com/ctuning/ck-guide-images/blob/master/ck-workflow.svg)](http://cKnowledge.org)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

Status
======
Relatively stable. We mainly use MILEPOST GCC now to extract 
semantic program features for compatibility with previous models.

We strongly suggest you to read this [getting started guide](https://github.com/ctuning/ck/wiki/First-steps) first!

Note that it becomes increasingly hard to rebuild MILEPOST GCC on latest Linux. 
This project was used as a proof-of-concept and we would like to develop similar feature extractors
at different abstraction levels inside the latest clang 3.7+ or GCC 6+ compiler - any help will be appreciated!

See reproducible and interactive ArXiv'18 article "A Collective Knowledge workflow for collaborative research 
into multi-objective autotuning and machine learning techniques" featuring MILEPOST GCC: [link](http://cKnowledge.org/rpi-crowd-tuning).

Prerequisites
=============
* Collective Knowledge Framework: http://github.com/ctuning/ck

Publications
============

```
@article {29db2248aba45e59:a31e374796869125,
   author = {Fursin, Grigori and Kashnikov, Yuriy and Memon, Abdul Wahid and Chamski, Zbigniew and Temam, Olivier and Namolaru, Mircea and Yom-Tov, Elad and Mendelson, Bilha and Zaks, Ayal and Courtois, Eric and Bodin, Francois and Barnard, Phil and Ashton, Elton and Bonilla, Edwin and Thomson, John and Williams, Christopher and O’Boyle, Michael F. P.},
   affiliation = {INRIA Saclay, Parc Club Orsay Universite, 3 rue Jean Rostand, 91893 Orsay, France},
   title = {Milepost GCC: Machine Learning Enabled Self-tuning Compiler},
   journal = {International Journal of Parallel Programming},
   publisher = {Springer Netherlands},
   issn = {0885-7458},
   keyword = {Computer Science},
   pages = {296-327},
   volume = {39},
   issue = {3},
   note = {10.1007/s10766-010-0161-2},
   year = {2011},
   url = {https://scholar.google.com/citations?view_op=view_citation&hl=en&user=IwcnpkwAAAAJ&citation_for_view=IwcnpkwAAAAJ:LkGwnXOMwfcC},
   keywords = {machine learning compiler, self-tuning compiler, adaptive compiler, automatic performance tuning, machine learning, program characterization, program features, collective optimization, continuous optimization, multi-objective optimization, empirical performance tuning, optimization repository, iterative compilation, feedback-directed compilation, adaptive compilation, optimization prediction, portable optimization}
}

@inproceedings{cm:29db2248aba45e59:c4b24bff57f4ad07,
   author = {{Fursin, Grigori and Lokhmotov, Anton and Savenko, Dmitry and Upton, Eben}},
    title = "{A Collective Knowledge workflow for collaborative research into multi-objective autotuning and machine learning techniques}",
  journal = {ArXiv e-prints}, 
 archivePrefix = "arXiv",
   eprint = {1801.08024},
 primaryClass = "cs.CY",
 keywords = {Computer Science - Computers and Society, Computer Science - Software Engineering},
     year = 2018,
    month = jan,
    url = {http://cknowledge.org/repo/web.php?wcid=report:rpi3-crowd-tuning-2017-interactive}
}

@inproceedings{Fur2009,
  author =    {Grigori Fursin},
  title =     {{Collective Tuning Initiative}: automating and accelerating development and optimization of computing systems},
  booktitle = {Proceedings of the GCC Developers' Summit},
  year =      {2009},
  month =     {June},
  location =  {Montreal, Canada},
  keys =      {http://www.gccsummit.org/2009}
  url  =      {https://scholar.google.com/citations?view_op=view_citation&hl=en&user=IwcnpkwAAAAJ&cstart=20&citation_for_view=IwcnpkwAAAAJ:8k81kl-MbHgC}
}
```

* http://arxiv.org/abs/1506.06256
* http://hal.inria.fr/hal-01054763
* https://hal.inria.fr/inria-00436029
* http://arxiv.org/abs/1407.4075
* https://scholar.google.com/citations?view_op=view_citation&hl=en&user=IwcnpkwAAAAJ&citation_for_view=IwcnpkwAAAAJ:LkGwnXOMwfcC

Authors of this CK workflow
===========================

* Grigori Fursin, cTuning foundation (France) / dividiti (UK)

License
=======
* GPLv2


Trying MILEPOST GCC using Docker image with Ubuntu 16.04
========================================================

You can get and try pre-installed MILEPOST GCC and cTuning CC as follows:
```
$ (sudo) docker run -it ctuning/ck-milepost-gcc-ubuntu16.04
$ cd `ck find demo:ctuning-cc`
$ ./_use_ctuning_cc_directly_extract_features.sh
```

Native installation
===================

Based on the community feedback we list the following Linux dependencies required to natively build MILEPOST GCC:

```
$ sudo apt-get update && apt-get install -y python-all git bzip2 sudo wget zip
$ sudo pip install ck
$ sudo apt-get install -y libjpeg8 libjpeg62-dev libfreetype6 libfreetype6-dev python-pillow
$ sudo apt-get install -y build-essential automake autoconf libncurses-dev uuid-runtime m4
$ sudo apt-get install -y gcc g++ g++-multilib libc6-dev-i386
$ sudo apt-get install -y texinfo libisl-dev libcloog-isl-dev libmpc-dev libgmp-dev libmpfr-dev
```

## Linux x86(64)

```
$ ck pull repo:reproduce-milepost-project
$ ck install package:compiler-gcc-4.4.4-milepost-src-deps
$ ck install package:compiler-ctuning-cc-2.5-plugins-src
$ ck install package:compiler-ctuning-cc-2.5-src
```

This should install MILEPOST GCC, plugins and ctuning-cc wrapper.

If it fails, you may try to install another package that does not recompile dependencies (such as GMP, MPFR, etc):

```
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps

```

Note that by default we install GCC with C and Fortran support. 
If you need C++, you should install the following package:
```
$ ck install package:compiler-gcc-4.4.4-milepost-with-cxx-src-deps
 or
$ ck install package:compiler-gcc-4.4.4-milepost-src-deps --env.ENABLE_LANGUAGES=c,c++,fortran

```

## Raspberry Pi and mobile devices

If you have a limited memory on your device (such as Raspberry Pi), install MILEPOST GCC first as follows:
```
$ ck pull repo:reproduce-milepost-project
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps --env.RPI3=YES --env.PARALLEL_BUILDS=2
$ ck install package:compiler-ctuning-cc-2.5-plugins-src-via-remote-ck
$ ck install compiler-ctuning-cc-2.5-src
```

Note that you may need to increase swap size on RPi3 before building GCC. 
You can change "CONF_SWAPSIZE=100" in /etc/dphys-swapfile to "CONF_SWAPSIZE=1000".
But don't forget to change it back after installation, 
otherwise your SD card may die sooner.

## Windows

You can install MILEPOST GCC on Windows as follows:
```
$ ck pull repo:reproduce-milepost-project
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps
$ ck install package:compiler-ctuning-cc-2.5-plugins-src
$ ck install compiler-ctuning-cc-2.5-src
```
or 
```
$ ck pull repo:reproduce-milepost-project
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps --target=mingw-64
$ ck install package:compiler-ctuning-cc-2.5-plugins-src
$ ck install compiler-ctuning-cc-2.5-src
```

Low level usage
===============

Then you can check demo scripts to extract features 
from your own program in the following CK entry:
```
$ cd `ck find demo:ctuning-cc`
```

You can try two self-descriptive scripts:
```
$ ./_use_ctuning_cc_directly_extract_features.sh
$ ./_use_ctuning_cc_directly_extract_features_rpi3.sh

$ ./_use_ctuning_cc_via_ck_pipeline.sh
$ ./_use_ctuning_cc_via_ck_pipeline_rpi3.sh
```

You can use MILEPOST GCC via virtual CK environment:
```
$ ck show env
$ ck virtual env --tags=compiler,milepost,gcc

Warning: you are in a new shell with a pre-set CK environment. Enter "exit" to return to the original one!

> ${CK_ENV_COMPILER_GCC_BIN}/gcc --version

gcc (GCC) 4.4.4

```

You can also try MILEPOST GCC demo via interactive CK dashboard:
```
$ ck dashboard milepost
```

Note that these are low-level components which are intended 
to be integrated with high-level workflows.

High level usage (CK workflows)
===============================

We integrated extraction of MILEPOST features with a "high-level" CK program pipeline.
You can extract MILEPOST features from any [CK program](http://cKnowledge.org/shared-programs.html), 
for example "cbench-automotive-susan" as follows:

```
$ ck pull repo:ctuning-programs
$ ck pipeline program:cbench-automotive-susan --speed --milepost --no_run --milepost_out_file=extracted-features.json

$ cd `ck find program:cbench-automotive-susan`
$ cd tmp
$ cat extracted-features.json
```

You can also use "features" key in the output of the CK program in your own CK workflows 
(similar to how we use it in this [RPi crowd-tuning project](http://cKnowledge.org/rpi-crowd-tuning)) 
as follows:
```
import ck.kernel as ck

r=ck.access({'action':'pipeline',
             'module_uoa':'program',
             'data_uoa':'cbench-automotive-susan',
             'speed':'yes',
             'milepost':'yes',
             'no_run':'yes',
             'out':'con'})
if r['return']>0: ck.err(r)

ck.debug_out(r)
```

You can quickly add your own CK program using templates as described 
[here](https://github.com/ctuning/ck/wiki/Adding-new-workflows):
```
$ ck add program:my-new-program
```

Notes
=====

## Using 1 process to extract MILEPOST features

Note that you currently can't use multiple instances of MILEPOST GCC to extract features from multiple files in parallel
(see related issue [#6](https://github.com/ctuning/reproduce-milepost-project/issues/6)). 
Therefore, if you use makefile to extract features, set 1 process as follows:
```
$ make -j1
```

## Extracting MILEPOST features from MPI programs

See ticket [#7](https://github.com/ctuning/reproduce-milepost-project/issues/7):

1. copy system mpicc to my local directory $HOME/benchmark. (because I want to modify it, but I do not have root access)
2. modify local copy mpicc, replace CC=gcc to CC=$(CK_CC)
3. export PATH=$HOME/benchmark:$PATH.

Then check other tickets [4](https://github.com/ctuning/reproduce-milepost-project/issues/4),
[5](Then check other tickets [4](https://github.com/ctuning/reproduce-milepost-project/issues/5),
[6](https://github.com/ctuning/reproduce-milepost-project/issues/6).

Docker
======
We added Dockerfile to let you customize and build your own MILEPOST GCC Docker instances.
You can find this file in the following entry:
```
$ cd `ck find docker:ck-milepost-gcc-ubuntu16.04`
```

You can build and run this image as follows:
```
$ ck build docker:ck-milepost-gcc-ubuntu16.04 (--sudo)
$ ck run docker:ck-milepost-gcc-ubuntu16.04 (--sudo)
```

Feedback
========

If you have problems, questions or suggestions, do not hesitate to get in touch
via the following mailing lists:
* https://groups.google.com/forum/#!forum/collective-knowledge
* https://groups.google.com/forum/#!forum/ctuning-discussions
