****************************************************************
Continuous Collective Compilation Framework (CCC)

Continuous Collective Compilation Framework (CCC) is a collaborative modular
plugin-enabled R&D infrastructure to automate program and architecture
optimizations using emperical iterative feedback-directed compilation
and to gather various static and dynamic optimization profile data in
the Collective Optimization Database (COD). 

CCC framework supports both global program optimization and fine-grain procedure, 
loop or instruction level optimizations if compiler supports Interactive Compilation
Interface. It is used to help end-users optimize their programs, libraries
and whole OS automatically (improve execution time/code size, etc), test and
tune compiler optimization heuristic. It also enables collaborative R&D and
optimization knowledge reuse with statistical and machine learning
techniques.

CCC Framework is a community-driven project - you are welcome to join the project,
extend it, provide smart search and data analysis plugins, leave feedback and add
your optimization data to help the community.

CCC framework website:
 http://cTuning.org/ccc

cTuning/CCC mailing lists (feedback, comments and bug reports):
 http://cTuning.org/community

CCC framework is used to train MILEPOST GCC to learn good optimizations
across multiple programs, datasets, compilers and architectures, and correlate
them with program features and run-time behavior:

http://cTuning.org/milepost-gcc

****************************************************************
Information:

 Continuous Collective Compilation Framework (CCC) has been developed
 by Grigori Fursin to enable collaborative R&D on program optimizations
 and architecture design. It is now a collaborative  plugin-enabled optimization
 infrastructure to perform  automatic search for good program optimizations to
 improve execution time, code size, etc and enable further analysis using statistical
 and machine learning techniques.

 CCC written in C (platform dependent part) and PHP (platform independent part and plugins).

 Current CCC supports flag optimization of major compilers such as GCC, Open64,
 LLVM, GCC4CLI, PathScale, Intel, IBM, etc. If compiler supports Interactive
 Compilation Interface (http://cTuning.org/ici), the plugins can perform pass selection
 and reordering on function level. We currently extend framework to support
 fine-grain optimizations such as loop unrolling, prefetching, polyhedral
 optimizations (tiling, splitting, fusion/fission), etc.

 CCC supports plugins to perform exhaustive, random, one-off search.
 We have plugins to predict good optimization based on static/dynamic program features,
 statistical analysis and machine learning.

 CCC supports the following benchmarks CBench/MiBench with MiDataSets (http://cTuning.org/cbench),
 EEMBC, SPEC CPU2006, SPEC CPU2000, SPEC CPU95, Polyhedron, etc.

 CCC can automatically improve code on most Unix-like major platforms (from server and supercomputer 
 to embedded architectures). It also supports bare-metal embedded systems.

 All optimization data is either collected off-line or in the Collective Optimization Database
 (http://cTuning.org/cdatabase) to avoid duplicate experiments, improve quality
 of research and boost innovation.

****************************************************************
Author:

 Grigori Fursin
  http://fursin.net/research
  http://unidapt.org

****************************************************************
Acknowledgments (suggestions, evaluation, bug fixes, etc):

 Yuriy Kashnikov (UVSQ, France)
 Abdul Wahid Memon (UVSQ, France)
 Menjato Rakoto (Paris South University and INRIA, France)
 Yuanjie Huang (ICT, China)
 Mircea Namolaru (IBM Haifa, Israel)
 John Thomson (University of Edinburgh, UK)
 Phil Barnard (ARC, UK)
 Erven Rohou (IRISA, France)
 Mingjie Xing (ICT, China)

****************************************************************
CCC Framework License:
 This program is free software; you can redistribute it and/or modify it 
 under the terms of the GNU General Public License version 2 as published 
 by the Free Software Foundation.

 This program is distributed in the hope that it will be useful, 
 but WITHOUT ANY WARRANTY; without even the implied warranty 
 of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
 See the GNU General Public License for more details:
 http://www.gnu.org/copyleft/gpl.html

****************************************************************
Collective Optimization Database Copyright and License:

 Collective Optimization Database (cDatabase or COD ) has been developed 
 by Grigori Fursin mostly in his spare time (Copyright 2004-current). 
 It is described in FT2009, FMTP2008 and in MILEPOST project proposal 
 and tech. reports (2005-2009). In 2009, Grigori opened public access 
 to this database (http://cTuning.org/cdatabase) in a hope that it is useful 
 to the community. cTuning website provides an open public access to cDatabase 
 since it is intended to share optimization knowledge with the community 
 and to enable community-driven program and system optimization. 
 It is provided AS IS, with no warranty of any kind, express or implied.

 Replication, mirroring, extension and public re-hosting of cDatabase requires 
 explicit agreement with Grigori Fursin to keep cDatabase, CTools APIs
 and web-services compatible and open to everyone. If you have any questions 
 or comments, please don't hesitate to contact Grigori.

****************************************************************
CCC Version history:

 V2.5 2010.March.15
 Build 1018:          * Multiple aggregated updats (major updates in speedup calculation engine
                        and multi-objective optimization engine: execution time, code size, compilation time)

 Build 1017:          * Grigori fixed many issues with src-plat-indep/include/ccc_script_functions.php
                        to avoid crashes when MySQL queries returns NULL ...

 Build 1016:          * Grigori updated milepost-gcc and cTuning functions, 
                        fixed mistake with CCC_GPROF (requires small benchmark update as well).

 Build 1015:          * Grigori updated functionality in src-plat-indep/include/ccc_scripts_functions.php
                        to unify calculation of speedups for execution time, code size, compilation time,
                        averge them correctly, detect cases with profiling and notes, etc:
                        - Function get_opt_cases is not deprecated and associated scripts are removed
                        - New function get_opt_cases1 to calculate speedups and return array of opt cases
                        - New function sort_speedups to sort based on multi-objective criterias such
                          as sort by exec.time, then compilation time, then code size, etc
                        - New function find_frontier to find frontier optimization cases in
                          multi-dimensional optimization spaces (2D, 3D, thresholds per dimension, etc).

                        Added associated script get-global-speedups, get-global-speedups-by-list.

                        Added plot-bar-graph to plot graphs based on cvs data the previous scripts.

                        Added directory src-plat-indep/plugins/Stats to save statistics/analysis info.

                        Updated most of the scripts in src-plat-indep/plugins to correctly support new functions.

 Build 1014:          * Added plugin src-plat-indep/plot-density-graph (uses R) 
                        that can be used with Speedup Test
                      * Updated src-plat-indep/includ/ccc_script_functions.php
                        (synced with some cTuning.org web services)

 Build 1013:          * Fixed bug with EXTRAINCLUDE flags in 
                        src-plat-dep/tools-aux/hardware-counters-papi/ccc-papi-list/Makefile

 Build 1012:          * src-plat-dep/plugins/compilation/ccc-run-glob-flags-rnd-fixed/ccc-run-glob-flags-rnd-fixed.c:
                        src-plat-dep/plugins/compilation/ccc-run-glob-flags-rnd-uniform/ccc-run-glob-flags-rnd-uniform.c:
                        src-plat-dep/plugins/compilation/ccc-run-glob-flags-one-by-one/ccc-run-glob-flags-one-by-one.c:
                        src-plat-dep/plugins/compilation/ccc-run-glob-flags-one-off-rnd/ccc-run-glob-flags-one-off-rnd.c:
                          Put fflush(NULL) before system(); 

 Build 1011:          * Time measurement mechanism changed. Now we are using /usr/bin/time program.

 Build 1010:          * Fixed bug in ccc-comp wrapper script that would not parse 
                        optimization flags properly before.

 Build 1009:          * Fixed bug with ccc-run.c and hardware counters,

 V2.0x 2009.May.29    Multiple updates based on user feedback:

                      * convert ccc-time CXX to C (now only C is needed)
                      * bug with SSL init in send data ...
                      * bug with Makefiles 
                      * bug when file size can be random if file is not generated
                      * remove . from $PATH
                      * set names of the compiler and linker in environment (ZCC, ZCXX, ZFC) 
                        to support different compilers
                      * add CCC_RE (runtime environment such as VM or simulator) to _run scripts
                      * add RE_ID to COD
                      * move compiler and runtime environment from ccc-env to separate files
                        to be able to install different version of the same compiler on the system:
                        # ccc-env.c.<compiler name> - compiler environment
                        # ccc-env.re.<runtime environment name> - runtime environment
                        # ccc-re.cfg - configuration file for runtime environments
                      * ccc-run now support CCC_RUN_RE environment variable to setup runtime environment
                      * add support for uuid / uuidgen in CCC_UUID environment variable
                      * add RUNTIME_ENVIRONMENTS table to COD
                      * sort out mistake at cTuning website to show function-level profiling
                      * update COD version
                      * changed tmp-ccc-run-datasets tmp-ccc-run-cmd
                      * fixed ccc-ml-accumulate-features (sometimes all features =0)
                      * add PathScale, GCC4CLI and LLVM compiler support
                      * save program binary name to _ccc_program_bin (for SPEC2006)
                      * save compiler environment to _ccc_compilation_env_cur (for SPEC2006)
                      * add support for OProfile ...
                      * CCC_OPROF
                      * CCC_OPROF_PARAM
                      * added CCC_TIMED_RUN instead of CCC_TIMEOUT
                      * added CCC_TASKSET
                      * added CCC_PROCESSOR_NUM to execute programs on a specific core
                      * MILEPOST GCC wrapper is added to support automatic feature extractor and querying
                        of COD web services to predict good optimizations with flags -ml, ml-e, -ml-c

 V1.x 2006-2009 Used in MILEPOST project (http://www.milepost.eu) and UNIDAPT group research (http://unidapt.org)

 beta 2004-2006 (called Framework for Continuous Optimization: http://fursin.net/wiki/index.php5?title=Research:Developments:FCO)

****************************************************************
Documentation:
 Currently available online at:
 http://cTuning.org/wiki/index.php/CTools:CCC:Documentation

 You can find some additional info about Collective Optimization
 concept in the following publications:

 http://unidapt.org/index.php/Dissemination#FT2009
 http://unidapt.org/index.php/Dissemination#Fur2009
 http://unidapt.org/index.php/Dissemination#FMTP2008

****************************************************************
Installation:
 Run INSTALL.sh to configure CCC Framework and compile all the tools

****************************************************************
