<<<<<<< HEAD
Reproducing MILEPOST project in CK format (machine learning based self-tuning compiler)
=======================================================================================

[![logo](https://github.com/ctuning/ck-guide-images/blob/master/logo-powered-by-ck.png)](http://cKnowledge.org)
[![logo](https://github.com/ctuning/ck-guide-images/blob/master/logo-validated-by-the-community-simple.png)](http://cTuning.org)

Status
======
Relatively stable. We mainly use MILEPOST GCC now to extract 
semantic program features for compatibility with previous models.

Prerequisites
=============
* Collective Knowledge Framework: http://github.com/ctuning/ck
* m4 (sudo apt-get install m4)

Publications
============

```
@article {29db2248aba45e59:a31e374796869125,
   author = {Fursin, Grigori and Kashnikov, Yuriy and Memon, Abdul Wahid and Chamski, Zbigniew and Temam, Olivier and Namolaru, Mircea and Yom-Tov, Elad and Mendelson, Bilha and Zaks, Ayal and Courtois, Eric and Bodin, Francois and Barnard, Phil and Ashton, Elton and Bonilla, Edwin and Thomson, John and Williams, Christopher and O�Boyle, Michael F. P.},
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

Authors
=======

* Grigori Fursin, cTuning foundation (France) / dividiti (UK)

License
=======
* GPLv2

Installation
============

You may need to install dependencies. For example, on Ubunutu or Raspbian you need to install the following:

```
$ sudo apt-get install build-essential automake autoconf libncurses-dev uuid-runtime
```

On x86(64) Linux:

```
$ ck pull repo:reproduce-milepost-project
$ ck install package:compiler-ctuning-cc-2.5-src
```

This should install MILEPOST GCC, plugins and ctuning-cc wrapper.

If you have a limited memory on your device (such as Raspberry Pi), install MILEPOST GCC first as following:
```
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps --env.PARALLEL_BUILDS=2
```

You can install MILEPOST GCC on Windows as following:
```
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps
```
or 
```
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps --target=mingw-64
```

On RPi3 you can install it as following:
```
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps --env.RPI3=YES --env.PARALLEL_BUILDS=2
$ ck install compiler-ctuning-cc-2.5-plugins-src-via-remote-ck

Note that you may need to increase swap size on RPi3 before building GCC. 
You can change "CONF_SWAPSIZE=100" in /etc/dphys-swapfile to "CONF_SWAPSIZE=1000".
But don't forget to change it back after installation, 
otherwise your SD card may die sooner.

Usage
=====

You can now install ctuning-cc wrapper for MILEPOST GCC:
``
 $ ck install compiler-ctuning-cc-2.5-src
```

Then you can check demo scripts to extract features from your own program
in the following CK entry:
```
$ ck find demo:ctuning-cc
```

You can try two self-descriptive scripts:
* _use_ctuning_cc_directly_extract_features.sh
* _use_ctuning_cc_directly_extract_features_rpi3.sh

* _use_ctuning_cc_via_ck_pipeline.sh
* _use_ctuning_cc_via_ck_pipeline_rpi3.sh

You can also try MILEPOST GCC demo via interactive CK dashboard:
```
$ ck dashboard milepost
```

Feedback
========

If you have problems, questions or suggestions, do not hesitate to get in touch
via the following mailing lists:
* https://groups.google.com/forum/#!forum/collective-knowledge
* https://groups.google.com/forum/#!forum/ctuning-discussions
=======
Reproducing MILEPOST project in CK format (machine learning based self-tuning compiler)
=======================================================================================

[![logo](https://github.com/ctuning/ck-guide-images/blob/master/logo-powered-by-ck.png)](http://cKnowledge.org)
[![logo](https://github.com/ctuning/ck-guide-images/blob/master/logo-validated-by-the-community-simple.png)](http://cTuning.org)

Status
======
Relatively stable. We mainly use MILEPOST GCC now to extract 
semantic program features for compatibility with previous models.

Prerequisites
=============
* Collective Knowledge Framework: http://github.com/ctuning/ck
* m4 (sudo apt-get install m4)

Publications
============

```
@article {29db2248aba45e59:a31e374796869125,
   author = {Fursin, Grigori and Kashnikov, Yuriy and Memon, Abdul Wahid and Chamski, Zbigniew and Temam, Olivier and Namolaru, Mircea and Yom-Tov, Elad and Mendelson, Bilha and Zaks, Ayal and Courtois, Eric and Bodin, Francois and Barnard, Phil and Ashton, Elton and Bonilla, Edwin and Thomson, John and Williams, Christopher and O�Boyle, Michael F. P.},
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

Authors
=======

* Grigori Fursin, cTuning foundation (France) / dividiti (UK)

License
=======
* GPLv2

Installation
============

You may need to install dependencies. For example, on Ubunutu or Raspbian you need to install the following:

```
$ sudo apt-get install build-essential automake autoconf libncurses-dev libgmp-dev libmpfr-dev uuid-runtime
```

On x86(64) Linux:

```
$ ck pull repo:reproduce-milepost-project
$ ck install package:compiler-ctuning-cc-2.5-src
```

This should install MILEPOST GCC, plugins and ctuning-cc wrapper.

If you have a limited memory on your device (such as Raspberry Pi), install MILEPOST GCC first as following:
```
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps --env.PARALLEL_BUILDS=2
```

You can install MILEPOST GCC on Windows as following:
```
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps
```
or 
```
$ ck install package:compiler-gcc-4.4.4-milepost-src-no-deps --target=mingw-64
```

Usage
=====

Please, check couple of scripts to extract features from your own program
in the following CK entry:
```
$ ck find demo:ctuning-cc
```

You can try two self-descriptive scripts:
* _use_ctuning_cc_directly_extract_features.sh
* _use_ctuning_cc_via_ck_pipeline.sh

You can also try MILEPOST GCC demo via interactive CK dashboard:
```
$ ck dashboard milepost
```

Feedback
========

If you have problems, questions or suggestions, do not hesitate to get in touch
via the following mailing lists:
* https://groups.google.com/forum/#!forum/collective-knowledge
* https://groups.google.com/forum/#!forum/ctuning-discussions
>>>>>>> b377d9a1774ed3d6d0051e4735f632b25a13c555
