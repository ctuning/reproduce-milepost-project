Reproducing MILEPOST project in CK format (machine learning based self-tuning compiler)
=======================================================================================

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

```
$ ck pull repo:reproduce-milepost-project
$ ck install package:compiler-gcc-4.4.4-milepost-src-linux
$ ck install package:compiler-ctuning-cc-2.5-plugins-src-linux
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

If you have problems, questions or suggestions, do not hesitate to get in touch
via the following mailing lists:
* https://groups.google.com/forum/#!forum/collective-knowledge
* https://groups.google.com/forum/#!forum/ctuning-discussions
