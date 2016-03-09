****************************************************************
cTuning Compiler Collection V2.5

cTuning CC is a free, open source compiler collection that combines
multiple tools and techniques developed during more than 10 years as the
first practical step toward self-tuning, adaptive computing systems based
on industrial tools, empirical techniques, collective optimization,
statistical analysis and machine learning.

It may not always be visible to the IT users, but developing and optimizing
computing systems using available over-complicated technology is too time
consuming and costly often resulting in underperforming, power-hungry and
inefficient computers and programs. Novel cTuning technology attempts to
overcome the complexity of computing system by automating architecture,
code and dataset analysis, characterization and multi- objective
optimization (currently execution time, code size and compilation time) and
enabling portable optimization using
* continuous parameterization and abstraction of all components of a 
  computing system (from architecture to operating system, compiler and code),
* continuous empirical collective optimization space exploration
  distributed among multiple users,
* continuous profiling and characterization of applications (extraction of
  program and architecture features), run-time behavior and resources,
* continuous sharing of analysis and optimization information in the
  Collective Optimization Database
* continuous refining and adaptation of performance models and optimization
  prediction based on standard statistical and machine learning techniques.

cTuning CC includes:
* New cTuning compiler wrapper to transparently extract program structure
  and features (using MILEPOST GCC), communicate with cTuning web services to
  share optimization data and predict optimizations, and invoke any other
  user compiler (GCC, LLVM, Open64, ICC, XL, ROSE, etc)
* MILEPOST GCC 4.4.x (self-tuning, adaptive, machine-learning based compiler)
  with ICI (plugin framework) v2.05 and MILEPOST feature extractor V2.1
* New Continuous Collective Compilation framework
* Collective Benchmark
* New plugins and web-services for multi-objective optimizations
  (balancing execution time, code size, compilation time)

We are developing cTuning infrastructure as a very simple, modular
and portable tool so that users could easily download, install and use it
to compile, execute, characterize and optimize their programs or tune
architecture and share optimization knowledge. Our users managed to optimize 
some large industrial applications such as BerkeleyDB (1.4 speedup over 
GCC 4.4.0 -O3 on several Intel Xeon machines), some audio and video codecs, 
multiple standard benchmarks, Linux kernel, etc.

Please, note that this is an on-going, evolving project driven by the
cTuning community, so please be patient or join the project and help to
improve cTuning infrastructure.

Category:
 self-tuning, adaptive computing systems

Keywords:
 adaptive compiler, self-tuning compiler, intelligent compiler, iterative
 compilation, feedback-directed compilation, collective optimization,
 program features, optimization prediction, predictive modeling, machine
 learning, statistical analysis, multi-objective optimization (balance
 execution time, code size, compilation time), optimization space frontier,
 collaborative experimental data sharing, cTuning web-services

****************************************************************
Coordination:

 Grigori Fursin, UNIDAPT Group, UVSQ, France
  http://fursin.net/research
 (original R&D for MILEPOST framework/ICI prototypes/CCC framework/
  Collective Optimization Database, cTuning.org and self-tuning
  computing systems)

 I am on sabbatical from March, 2010 to help create a new Exascale Research
 Center in France so I have very little spare time to coordinate these
 developments. I hope that my students and the community will continue
 extending this framework ...

****************************************************************
License:

 This program is free software; you can redistribute it and/or modify it
 under the terms of the GNU General Public License version 2 as published by
 the Free Software Foundation.

 This program is distributed in the hope that it will be useful, but
 WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 for more details.

 If you find this software useful, you are welcome to reference
 http://cTuning.org website and these publications:
  http://unidapt.org/index.php/Dissemination#Fur2009
  http://unidapt.org/index.php/Dissemination#FMTP2008
  http://unidapt.org/index.php/Dissemination#FT2009
 in your derivative works.

****************************************************************
Development/testing/evaluation:

 cTuning Compiler Collection V2.5/MILEPOST GCC V2.1 (2009-2010)
  Grigori Fursin (UVSQ, France) - new design, new cTuning compiler wrapper
                                  around MILEPOST GCC and other compilers
                                  such as LLVM, Open64, ROSE, ICC, XL, etc,
                                  CCC framework, new statistical analysis
                                  plugins and new optimization/prediction
                                  services.
  Yuriy Kashnikov (UVSQ, France) - testing/evaluation on Berkeley DB
  Abdul Wahid Memon (UVSQ, France) - testing/evaluation on cBench and bug
                                     fixes/extensions to support whole
                                     Linux recompilation (such as GENTOO)
  Joern Rennecke (UK) - testing/providing support for g++ in MILEPOST GCC; 
                        moving some parts of ICI to mainline GCC 4.5
                        (plugin framework)
  Jeremy Singer (University of Manchester, UK) - adding new static program
                                                 features
  Nikhil Kapur - testing on Mozilla/libvorbis

 MILEPOST GCC beta versions, V1.0 (2006-2009):
  Grigori Fursin (INRIA, France) - original design of the MILEPOST/ICI/cTuning 
                                   framework
  Mircea Namolaru (IBM Research Lab, Israel) - feature extractor pass
  Cupertino Miranda (INRIA, France) - ICI extensions
  Zbigniew Chamski (INRIA, France) - ICI extensions

 Includes ICI and CCC frameworks - you can find more information about
 those framework in the associated README files.

****************************************************************
Description:

 It may not always be visible to the IT users, but developing and
 optimizing current and emerging computing systems using available
 technology is too time consuming and costly. Tuning hardwired compiler
 optimizations for rapidly evolving hardware makes porting an optimizing
 compiler for each new platform extremely challenging. Our radical approach
 is to develop a modular, extensible, self-tuning intelligent compiler that
 automatically learns the best optimization heuristics based on combining
 feedback-directed iterative compilation and machine learning.
 cTuning/MILEPOST GCC is a machine learning based compiler that
 automatically adjusts its optimization heuristics to improve execution
 time, code size, compilation time and other parameters of any given
 program on any given architecture.

 In 2006, after many years of discussions, the MILEPOST consortium has been
 created (INRIA, IBM Haifa, University of Edinburgh (project coordinator -
 Prof. Michael O'Boyle, tech. coordinator - Dr. Grigori Fursin), ARC
 International Ltd. and CAPS Entreprise) funded by EU FP6 program to start
 developing such a practical compiler based on previous research and
 experience of each partner. The development of the MILEPOST GCC and
 MILEPOST Framework has been coordinated by Dr. Grigori Fursin. The main
 idea was to understand how to parametrize all optimizations and move
 previously research technology on iterative feedback-directed compilation
 and machine learning techniques to production compilers to be able to use
 it on a range of architectures from  embedded reconfigurable processors to
 high-performance computing systems.

 In contrast with other tools and projects that are either commercial, non
 open-source, exist only in publications or as unstable prototypes,
 cTuning/MILEPOST GCC is the first practical attempt to apply machine
 learning, statistical collective optimization and run-time adaptation
 inside a stable, production-quality compiler in order to simplify and
 automate the development of compilers, architectures, run-time systems and
 programs, and enable future self-optimizing smart computing systems.

 cTuning/MILEPOST GCC combines the strength of the production quality GCC
 that supports more than 30 families of architectures and can compile real,
 large applications including Linux, and the flexibility of the Interactive
 Compilation Interface that transforms GCC into a research compiler. It is
 currently based on predictive modeling using program and machine-specific
 features, execution time, hardware counters and off-line training. cTuning
 GCC includes MILEPOST static program feature extractor developed by IBM
 Haifa. cTuning/MILEPOST technology is orthogonal to GCC and can be used in
 any future adaptive self-tuning compiler using common Interactive
 Compilation Interface. For example, we hope to see our technology in LLVM,
 ROSE and even commercial compilers in the future. cTuning infrastructure
 automates code and architecture optimization to improve execution time,
 code size, compilation time and other characteristics at the same time.

 cTuning compiler is a wrapper around MILEPOST GCC or any other compiler
 with ICI that detects new -Oml flag among others, extracts program
 features, queries optimization prediction web-service connected to
 optimization repository and substitutes default optimizations with the
 suggested ones based on program similarities and machine learning to
 improve execution time, code size and compilation time on the fly.

 In June, 2009, first stable version of MILEPOST GCC has been released and
 all further developments have been integrated with the cTuning tools:
 Collective Optimization Database, cTuning optimization prediction
 web-services, Interactive Compilation Interface for GCC, Continuous
 Collective Compilation Framework to enable collaborative community-driven
 developments after the end of the MILEPOST project (August 2009). You are
 warmly welcome to join cTuning community and follow/participate in
 developments and discussions using cTuning Wiki-based portal and 2 mailing
 lists: high volume development list and low volume announcement list:
 http://cTuning.org/community.

 We don't claim that cTuning/MILEPOST GCC and cTuning tools can solve all
 optimization problems ;) but we believe that having an open
 research-friendly extensible compiler with machine learning and adaptive
 plugins based on production quality GCC that supports multiple languages
 and architectures opens up many research opportunities for the community
 and is the first practical step toward our long-term objective to enable
 adaptive self-tuning computing systems. With the help of the community, we
 hope to provide better validation of code correctness when applying
 complex combinations of optimizations, provide plugins for XML
 representation of the compilation flow, tuning of fine-grain
 optimizations/polyhedral GRAPHITE transformations/link-time optimizations,
 code instrumentation and run-time adaptation capabilities for statically
 compiled programs (see Google Summer of Code'09 program). We would also
 like to add support to cTuning GCC/tools to be able to optimize whole
 Linux (Gentoo-like) or optimize programs for mobile systems on the fly
 (for example, using Android, Moblin, etc) and extend this technology to
 enable realistic adaptive parallelization, data partitioning and
 scheduling for heterogeneous multi-core systems using statistical and
 machine learning techniques.

 Currently, we use several iterative search strategies within CCC framework
 to find combinations of good optimization flags to substitute GCC default
 optimization levels for a particular architecture (such as
 -O0,-O1,-O2,-O3,-Os which we will not need in the future adaptive
 compilers) or tune optimization passes on a function-level for a
 particular program. Our preliminary experimental results (some are now
 available in the Collective Optimization Database) show that it is
 possible to considerably reduce execution time and code size of various
 benchmarks (MiBench, MediaBench, EEMBC, SPEC) on a range of platforms
 (x86, x8664, IA64, ARC, Loongson/Godson, etc) entirely automatically.

 cTuning/MILEPOST GCC and Collective Optimization Concept are described in
 detail in the following publications:
  http://unidapt.org/index.php/Dissemination#FMTP2008
  http://unidapt.org/index.php/Dissemination#Fur2009
  http://unidapt.org/index.php/Dissemination#FT2009

****************************************************************
Related links:

* Collective Tuning Center is a community-driven collaborative portal that
    enables sharing of optimization knowledge among multiple users and
    development of common R&D tools with open APIs to automate program
    optimization, compiler design and architecture tuning using empirical,
    statistical and machine learning techniques. 

    http://cTuning.org

* Collective Optimization Database to share optimization cases from the community,
    provide web-services and plugins to analyze collective optimization
    data and predict good program optimizations based on statistical and
    machine learning techniques, and improve the quality and
    reproducibility of the compiler and architecture research.

    http://cTuning.org/cdatabase

* Online ML program optimization predictor (web-service) to suggest profitable
    optimizations that improve execution time/code size, etc based on

    http://cTuning.org/cpredict

* Continuous Collective Compilation Framework to automate and distribute iterative 
    feedback-directed exploration of large optimization spaces by multiple users.

    http://cTuning.org/ccc

* Interactive Compilation Interface to "open up" and transform production compilers 
    into stable interactive research toolsets using event-driven plugin
    system instead of developing new research compilers from scratch.

    http://cTuning.org/ici

* Collective Benchmark with multiple datasets to enable realistic benchmarking 
    and research on iterative compilation and run-time adaptation.

    http://cTuning.org/cbench

* Universal Adaptation Framework to enable run-time adaptation and optimization 
    of statically-compiled programs for heterogeneous multi-core architectures.

    http://cTuning.org/unidapt

* cTuning/ICI/MILEPOST GCC mailing lists (feedback, comments and bug reports):

    http://cTuning.org/community
    http://groups.google.com/group/ctuning-discussions
    http://groups.google.com/group/ctuning-announce

****************************************************************
History:

 cTuning CC V2.5.1 - 20121026         - * Grigori Fursin added support for Collective Mind Framework.
                                          See demo-for-cm. Do not forget to update file
                                          set_environment_for_analysis_compiler__milepost_gcc.sh
                                          with your cM settings.
                                          Gradually, all ctuning functionality will be moved
                                          to Collective Mind framework and then cTuning will be
                                          discontinued.

 cTuning CC V2.5 - 20100520           - * added cTuning CC wrapper that can be used with any
                                          compiler to enable transparent architecture, code and
                                          dataset analysis, characterization and multi-objective
                                          optimization (currently execution time, code size and
                                          compilation time) based on empirical iterative feedback
                                          directed compilation, statistical analysis, collective
                                          optimization and machine learning (predictive modeling).

                                          cTuning-cc performs the following:
                                          * detects special flags or environment variables to invoke
                                            analysis compilers that support Interactive Compilation
                                            Interface (currently MILEPOST GCC -
                                            http://cTuning.org/milepost-gcc) to analyze code
                                            structure, extract features, select and reorder
                                            optimizations, etc.

                                          * communicates with cTuning.org web-services and Collective 
                                            Optimization Database (http://cTuning.org/cdatabase) to
                                            suggest better optimizations based on program, dataset
                                            and architecture features and machine learning or to
                                            return an optimization referenced by the unique cTuning
                                            ID (useful for manual sharing of optimization data,
                                            academic experiments or bug reports, etc).

                                          * invokes any user compiler (for example, GCC, LLVM, ICC, 
                                            Open64, Rose, XL, etc) with the returned optimizations
                                            from cTuning.org.

                                        * created new cTuning wiki page for cTuning Compiler Collection
                                          http://cTuning.org/ctuning-cc

                                        * added full ccc-framework to enable characterization of 
                                          programs and architectures, iterative compilation for
                                          multi-objective optimization (execution time, code size,
                                          compilation time), training of machine learning models to
                                          predict optimizations, collective optimization

                                        * fixed compilation of GCC 4.4.x and 4.5.0 with new GMP and PPL
                                          (also added a few flags during GCC compilation from
                                           http://openwall.info/wiki/internal/gcc-local-build)

                                        * added support for GCC 4.4.4

                                        * added new cTuning CC flags and environment variables
                                          to transparently/explicitly extract program structure 
                                          and program features

                                        * added more demo scripts

 MILEPOST GCC V2.1 (4.4.x) - 20100315 - Pre-release of the fully updated compiler that includes
                                        parts of the CCC framework and can transparently communicate
                                        with cTuning web-services to suggest profitable
                                        optimizations to improve/balance execution time, code size
                                        and compilation time using correlation between program
                                        features, optimizations and run-time behavior. The MILEPOST
                                        GCC wrapper from CCC framework can be easily converted to
                                        work with any other compiler such as LLVM, Open64, Intel
                                        compilers.

                                        It also allows to directly and transparently use
                                        optimizations Collective Optimization Database
                                        (http://cTuning.org/cdatabase) referenced by unique
                                        optimization ID that is useful for sharing of profitable
                                        optimization cases with the community.

                                        Preliminary experiments show that it is now possible to
                                        transparently recompile standard programs/libraries/Linux
                                        kernel and the whole Linux with new MILEPOST GCC. We are
                                        looking for volunteers to evaluate performance for Linux
                                        individual programs/libraries/kernel.

                                        MILEPOST GCC V2.1 now officially supports C,C++ and Fortran.

 MILEPOST GCC V1.5 and V2.0           - Internal development versions of compiler that were not 
                                        officially released.

 MILEPOST GCC 4.4.0 - 20090629        - New official version of MILEPOST GCC with new ICI v2.0
                                        and updated static feature extractor.

 MILEPOST GCC 4.2.2 - 20080613        - Stable MILEPOST GCC version used in most of the experiments 
                                        from the MILEPOST Year 3

****************************************************************
Directories/files:

 milepost-gcc-4.4.x              - MILEPOST GCC 4.4.x source directory (core + g++ + gfortran + 
                                   GRAPHITE support) with ICI v2.05 and MILEPOST feature extractor V2.1

 ccc-framework                   - Continuous Collective Compilation Framework to distribute optimization 
                                   space exploration among multiple users, share optimization data
                                   in Collective Optimization Database to enable machine learning
                                   for optimization predictions. This framework includes cTuning
                                   compiler wrapper to transparently extract program structure and
                                   features (using any compiler that supports ICI such as MILEPOST
                                   GCC), communicate with cTuning web services to share optimization
                                   data and predict optimizations, and invoke any other user
                                   compiler (GCC, LLVM, Open64, ROSE, etc) (http://cTuning.org/ccc).

 src-third-party                 - Third party support tools
  |
  +-- gmp-5.0.1                    - GMP library (user can update if needed)
  +-- gmp-4.3.0                    -   Different GMP versions (*)
  +-- mpfr-2.4.2                   - MPFR library (a user can update if needed)
  +-- mpfr-2.4.1                   -   Different MPFR  (*)
  +-- mxml-2.6                     - XML library for plugins
  +-- ppl-0.10.2-modified          - PPL library (for GRAPHITE), slightly modified by Grigori 
  |                                    to support GMP-5.0.1
  +-- ppl-0.10.2                   -   Different PPL library (*)
  +-- cloog                        - CLOOG library (for GRAPHITE, latest version from GIT)
  +-- cloog.old-milepost-gcc-v1    -   Different CLOOG versions (*)
  +-- mpc-0.8.1                    -
  +-- XSB                          - Prolog to calculate program features

 plugins-ici-2.0x                - Plugins for GCC 4.4.x with ICI (see README inside this directory)

 demo                            - Demo programs for cTuning GCC
  |
  +-- bitcount                     - bitcount example written in C from cBench.
  +-- bzip2-1.0.5                  - bzip2 written in C with a few scripts to show how to use MILEPOST GCC 
  |                                  with standard programs without any project changes.
  +-- libvorbis-1.2.3              - standard vorbis library to show how to use MILEPOST GCC
  |                                  with standard libraries/kernel without any project changes.
  +-- matmul.c                     - simple matmul example written in C.
  +-- matmul.cpp                   - simple matmul example written in C++.
  +-- matmul.fortran               - simple matmul example written in Fortran.

 install                         - Directory with installed binaries

 (*) included for compatibility with older versions of cTuning CC/MILEPOST GCC
     to be able to reproduce experimental/optimization results

****************************************************************
Installation:

 First, check in all scripts that you have the same BUILD_EXT variable
  that points to the install directory! You may have different names
  if you install cTuning/MILEPOST GCC for several architectures on the shared
  file system ...

 Invoke:
  ./_build_all.sh to build the whole cTuning compiler collection with all necessary tools.

  This script invokes the following scripts:
   ./_build_gcc.sh to build GCC with all the third-party tools.
   ./_build_ccc.sh to build CCC framework with cTuning compiler wrapper.
   ./_build_plugins.sh will build all non-machine learning plugins.
   ./_build_plugins_ml.sh will build all machine learning plugins.

****************************************************************
General configuration:

  Check ./_set_environment_for_analysis_compiler__milepost_gcc.sh - normally
  all environment variables should be already properly set (check variable CCC_UUID -
  the uuid tool). You have to source this file before using cTuning CC - it tells
  cTuning CC to use MILEPOST GCC for program analysis (extraction of features
  and access to fine-grain optimizations through ICI).

  Importantly, cTuning CC can now use any compiler that supports ICI and cTuning/MILEPOST 
  technology for code analysis and characterization, that is configured through
  the following environment variables (using GCC as an example):

    CTUNING_ANALYSIS_CC=gcc
    CTUNING_ANALYSIS_CPP=g++
    CTUNING_ANALYSIS_FORTRAN=gfortran

  File ./_set_environment_for_plugin_tests.sh sets up environment
  variables for low-level ICI tests and should also be already properly
  set. If you plan to use only high-level cTuning CC, you can skip it.

****************************************************************
Configuration:

  * You can find how to use cTuning Compiler Collection either transparently
    without Makefile modifications or explicitly using multiple
    benchmarks in the demo directory (bitcount, bzip2, libvorbis, matmul).

    You need to first configure environment variables in the
    ___common_environment.sh which are user-dependent:

    cTuning CC can use 2 separate compilers - one for analysis (should support
    ICI and cTuning/MILEPOST technology for program and architecture characterization,
    self-tuning and adaptation such as MILEPOST GCC) and another can be any user compiler
    (GCC, LLVM, ICC, ROSE, Open64, XL, etc) driven by the analysis compiler.

    User compiler is defined using the following environment variables (using GCC as an example):

      CTUNING_COMPILER_CC=gcc
      CTUNING_COMPILER_CPP=g++
      CTUNING_COMPILER_FORTRAN=gfortran

    CCC_CTS_USER and CCC_CTS_PASS should be set to your username and password when
    self-registering at http://cTuning.org/wiki/index.php/Special:UserLogin

    NOW YOU CAN TEST cTuning CC wrapper and communication with the cTuning database
    by invoking __test_milepost_gcc.sh. If everything is installed correctly, you
    should get a response from the cTuning web-service: "Test passed successfully".

    In order to continue using cTuning CC, you can check the following variables:
    Note that they already have default parameters so you do not have to change that
    unless you want to tune cTuning CC:

    CCC_CTS_URL=cTuning.org/wiki/index.php/Special:CDatabase?request=
                - points to the cTuning web-service.

    CCC_CTS_DB=cod_opt_cases - points to the database with optimization cases
               from the community.

    ICI_PLUGIN_VERBOSE=1 - if set to 1, additional diagnostic information from ICI plugins.
    ICI_VERBOSE=1 - if set to 1, additional diagnostic information from ICI.


    ICI_PROG_FEAT_PASS=fre - sets pass after which to extract static program features.

    CCC_COMPILER_FEATURES_ID=129504539516446542 - sets compiler ID which was used
                             to extract static program features for all programs
                             at cTuning.org. Do not changed it unless you really
                             understand what you are doing ;) !..

    CCC_OPTS="-O3" - sets combination of flags to be used if cTuning prediction web-service
                     did not return optimization flags.

    CCC_OPT_ARCH_USE=1 - if set to 1, cTuning CC will also use architecture-dependent flags
                         (such as -march=athlon64) from cTuning.org. If set to 0, architecture
                         dependent flags will be ignored.

    TIME_THRESHOLD=0.3 - when calculating speedups at cTuning.org, only optimization cases
                         with EXECUTION TIME more than this threshold are considered.

    NOTES= - when <>"", only those optimization cases are returned that have this NOTES.

    PG_USE=0 - if set to 1, only those optimization cases are returned that have function and other
               level profiling. If unset or set to 0, use only those cases that do not have profiling
               to avoid speedup skewing due to profiling.

    OUTPUT_CORRECT=1 - if set to 1, only those optimization cases are returned that have been
                       checked for correctness by comparing benchmark outputs for the original
                       and transformed program (note that it still does not guarantee that
                       the combination of optimizations is correct, but it helps to reduce
                       obvious wrong cases).

    RUN_TIME=RUN_TIME - sets which execution time to use when calculating speedups
                        (RUN_TIME - overall program execution time,
                         while RUN_TIME USER - only user execution time)

    SORT=012 - when predicting optimizations, the best combinations of optimizations
               are selected from the most similar program. Naturally, that program
               can have flags that improve not only execution time, but also code
               size and compilation time among other parameters. Hence a user can
               suggest an order of sorting speedups by:
                0 - execution time
                1 - code size,
                2 - compilation time
               before returning the top optimization. For example, when setting this variable to
               012 - cTuning returns the optimization case with the highest execution time
               and only then sorts them by code size improvement and compilation time speedup;
               102 - cTuning returns the optimization case with the highest code size improvement,
               then execution time speedup and then compilation time;
               201 - cTuning returns the optimization case with the highest compilation time speedup,
               then execution time speedup and only then code size.

    CT_OPT_REPORT=1 - when set to 1, cTuning returns all optimization cases sorted according to SORT
                      environment variable together with the associated optimization ID so that user
                      could later force different optimization case, particularly when having multi-objective
                      optimization scenarios.

                      Here is an example of such output:

                         ****************************************************************************
                         Checking program features (and aggregating them if generated) ...

                         Static program features:
                         ft1=9, ft2=2, ft3=1, ft4=0, ft5=4, ft6=1, ft7=0, ft8=2, ft9=1, ft10=0, ft11=0,
                         ft12=0, ft13=5, ft14=0, ft15=0, ft16=8, ft17=0, ft18=0, ft24=27, ft25=13.50, ft19=0,
                         ft39=0, ft20=1, ft21=0, ft33=0, ft21=24, ft35=2, ft22=11, ft23=0, ft34=6, ft36=3,
                         ft37=0, ft38=0, ft40=0, ft41=8, ft42=0, ft43=0, ft44=0, ft45=0, ft46=1, ft48=3, ft47=9,
                         ft49=0, ft51=0, ft50=55, ft52=21, ft53=0, ft54=2, ft55=0, ft26=0, ft27=0, ft28=0, ft29=0,
                         ft30=5, ft31=0, ft32=0

                         Submitting features to the cTuning web-service to predict good optimizations ...

                         cTuning Optimization Report (optimal optimization cases):

                         Distance from most close program (462.libquantum) = 0.639

                         Selected opt. case = 23011215880571251

                         Optimal cases on frontier (averaged speedups):
                         Ex.time:   Code size:   Comp. time:        cTuning opt. case:

                            1.18         0.80           1.00         15423655473087225
                            1.21         0.80           0.80            29686176401405
                            1.25         0.70           0.80          4614589283098526
                            1.29         0.67           0.80         23011215880571251
                            1.25         0.70           0.80         15721270875126789
                            1.26         0.69           0.80         15128754576807000
                            1.29         0.67           1.00         19230939973657069
                            1.07         1.02           1.00          3258730975700728
                            1.21         0.80           1.00         23810155474721838
                            1.24         0.71           1.00          4699569679776380
                            1.26         0.68           0.83         15492934568598271

                         Predicted flags:
                         -O2 -fdelete-null-pointer-checks -fno-tree-pre -funroll-all-loops

                         Invoking command:
                         gcc -O2 -fdelete-null-pointer-checks -fno-tree-pre -funroll-all-loops  bitarray.c
                                  bitcnt_1.c bitcnt_2.c bitcnt_3.c bitcnt_4.c bitcnts.c bitfiles.c bitstrng.c
                                  bstr_i.c loop-wrap.c 
                         ****************************************************************************

    Multi-objective optimizations:
     When there are many optimization cases that improve at the same time execution time, code size
     and compilation time, the selection of an optimal optimization case depends on depends on end-user
     usage scenarios: improving both execution time and code size is often required for embedded applications,
     improving both compilation and execution time is important for data centers and real-time systems,
     while improving only execution time is common for desktops and supercomputers. Hence, we provided several
     other environment variables to select optimization cases on the frontier of the optimization space:

    DIM=012 - returns optimization cases only on the frontier of all optimization cases.
              For example DIM=01 produces 2D frontier for execution time speedup and code size improvement,
              DIM=02 produces 2D frontier for execution time and compilation time speedups,
              DIM=12 produces 2D frontier for code size improvement and compilation time speedup,
              DIM=012 produces 3D frontier for all constraints.

    CUT=0,0,0 - cuts optimization cases frontier on each dimension, i.e. if CUT=0,0,1.2
                the frontier optimization cases should have compilation time speedup > 1.2,
                if CUT=1,1,1, all optimization cases on frontier should have execution time
                speedup > 1, code size improvement > 1 and compilation time > 1.

    When using this mode with DIM=012 and CUT=1,1,1, only one optimization case will be returned
    (when using CT_OPT_REPORT=1):

                            1.07         1.02           1.00          3258730975700728

    Note, that you have to select such cases manually, because cTuning CC will still use
    the top optimization case before building frontier since the last one really depend on
    user scenario.

    The following info is very important to find optimization cases from similar program
    for the following architecture (you can most similar architecture to yours at
    with optimization case at http://cTuning.org/cdatabase)

    CCC_PLATFORM_ID=2111574609159278179    (example for AMD Athlon 64 3700+)
    CCC_ENVIRONMENT_ID=2781195477254972989 (example for Linux Mandriva 2.6.17-10alchemy)
    CCC_COMPILER_ID=331350613878705696     (example for GCC 4.4.0)

    When compiling large applications, feature extraction can take a very long time
    (and this is part of the future work to speed it up), so a user may want to
    extract features only of a few functions. In this case, a user should add
    the file _ctuning_select_functions.txt to the compilation directory where
    only those functions should be listed that need to be processed
    (one function per line).

  * If you want to test low-level plugins, you can find self-explanatory
  tests in plugins-ici-2.05/tests directory.

****************************************************************
Usage:

  * cTuning web-services test:

    ctuning-cc --ct-test *.c

    You can also use test script ./__test_ctuning_web_service_for_ctuning_cc.sh

  * Using optimization cases directly from the Collective Optimization Database
    (referenced by unique ID) - it is useful for multi-objective optimization,
    to share optimization cases within the community or when publishing papers
    and results on program optimization:

    ctuning-cc --ct-opt=11475790782770590 *.c

    You can also use demo script ./__compile_using_ctuning_cc_with_fixed_optimization.sh
    to understand how to configure your own system.

  * Predict good optimizations (execution time, code size, compilation time)
    based on correlation of program features and optimizations using collective optimization
    knowledge (empirical iterative feedback-directed compilation performed by multiple
    users and shared in the Collective Optimization Database):

    ctuning-cc -Oml *.c

    You can also use demo script ./__compile_using_ctuning_cc_with_predicted_optimization.sh
    (or ./__compile_using_ctuning_cc_with_predicted_optimization_tr.sh for transparent
    invocation of this mode without flags through environment variables)
    to understand how to configure your own system.

  * Extract program structure:

    ctuning-cc -O3 --ct-extract-structure *.c

    You can also use demo script ./__extract_program_structure_using_ctuning_cc.sh
    (or __extract_program_structure_using_ctuning_cc_tr.sh. for transparent
    invocation of this mode without flags through environment variables)
    to understand how to configure your own system.

  * Extract program features:

    ctuning-cc -O3 --ct-extract-features *.c

    You can also use demo script ./__extract_program_features_using_ctuning_cc.sh
    (or __extract_program_features_using_ctuning_cc_tr.sh. for transparent
    invocation of this mode without flags through environment variables)
    to understand how to configure your own system.

  * Some of the above methods can be invoked transparently without any Makefile modifications,
    using CTUNING_* environment variables. Look at the scripts in demo directory.
****************************************************************
Feature extractor:
 * Low level pass ml-feat (gcc-4.4.x/gcc/ml-feat.c) invoked through ICI after 
   a given pass (currently fre). It saves low-level info about program into external file
   that is later processed by high-level feature extractor.

 * High level feature extractor 
   (plugins-ici-2.05/src-ml/extract-program-static-features.legacy/ml-feat-proc/featlstn.P)
   is written in Prolog to calculate features based on low-level information obtained from ml-feat pass).

 V2.1 - featlstn.P - 55 features (removed duplicate feature ft21).
        featlstn1.P - 56 features (move duplicate feature to ft56).
        featlstn2.P - 65 features (ft57-65 features have been added by Jeremy Singer).

        NOTE: Current cTuning.org prediction web-services, etc are hardwired to work with
              the original feature list featlstn.P. In the future we should change that to
              support any feature list. For example, we plan to add polyhedral program representation
              as a feature set and then use cTuning learning and prediction services directly.

 V2.0 - bug fixes

 V1.0 - featlstn.P - had two duplicate features ft21 (thanks to Jeremy Singer who reported that bug).

****************************************************************
cTuning compiler unique IDs (COMPILER_ID):

 * cTuning CC 2.5 GCC 4.4.0 ICI 2.05 MILEPOST 2.1, COMPILER_ID=164654947683234
 * cTuning CC 2.5 GCC 4.4.1 ICI 2.05 MILEPOST 2.1, COMPILER_ID=327397845688213
 * cTuning CC 2.5 GCC 4.4.2 ICI 2.05 MILEPOST 2.1, COMPILER_ID=5432645853305414
 * cTuning CC 2.5 GCC 4.4.3 ICI 2.05 MILEPOST 2.1, COMPILER_ID=93216642957846
 * cTuning CC 2.5 GCC 4.4.4 ICI 2.05 MILEPOST 2.1, COMPILER_ID=674893631465783

****************************************************************
Online documentation:

 http://cTuning.org/wiki/index.php/CTools:CTuningCC:Documentation

****************************************************************
Acknowledgments (cTuning CC, MILEPOST GCC / Interactive Compilation Interface / cTuning):

 * MILEPOST project colleagues (University of Edinburgh, INRIA, CAPS Entreprise, IBM)

 * Fabio Arnone (STMicroelectronics, France)
 * Phil Barnard (ARC, UK)
 * Francois Bodin (CAPS Entreprise, France)
 * Zbigniew Chamski (InfraSoft IT Solutions, Poland)
 * Bjorn Franke (University of Edinburgh, UK)
 * Grigori Fursin (INRIA/UVSQ, France)
 * Taras Glek (Mozilla, USA)
 * Nikhil Kapur
 * Yuriy Kashnikov (UVSQ, France)
 * Abdul Wahid Memon (UVSQ, France)
 * Cupertino Miranda (INRIA, France)
 * Mircea Namolaru (IBM, Israel)
 * Jose Noudohouenou (UVSQ, France)
 * Diego Novillo (Google, USA)
 * Sebastian Pop (AMD, USA)
 * Joern Rennecke (UK)
 * Jeremy Singer (University of Manchester, UK)
 * Basile Starynkevitch (CEA, France)
 * Ayal Zaks (IBM, Israel)

 Other colleagues from IBM, NXP, STMicroelectronics, ARC, CAPS Enterprise, Mozilla, UVSQ ...

****************************************************************
Future work:

 It's a community-driven project. You can find information
 about extensions at http://cTuning.org/ctuning-cc

 Some urgent features to add (we are looking for volunteers to help us!):

 * provide ID for each program, function, loop, etc to share optimization knowledge
 * cache features and optimization results
 * add routines for transparent feedback for collective optimization (see paper)
 * port MILEPOST GCC to GCC 4.5 (finish Google Summer of code'09 and winter 2009/2010 developments)
   http://cTuning.org/ici
 * add proper optimization support on a function level (aggregate multiple previous prototypes)
 * add/extend support for dynamic optimization and adaptation using GCC4CLI, MILEPOST GCC and .NET VM

****************************************************************
