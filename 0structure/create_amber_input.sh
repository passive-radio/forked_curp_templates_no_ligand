#!/bin/sh -xeu
#PJM -L rscgrp=fx-debug
#PJM -L elapse=01:00:00
#PJM --mpi proc=1
#PJM -j

prefix=$TEMPLATE_PROJECT_PREFIX
output_dir=$prefix/0structure/output

if [ ! -e $output_dir ]; then mkdir -p $output_dir; fi
if [ ! -e $prefix/0structure/log ]; then mkdir -p $prefix/0structure/log; fi

# ====
# Leap
# ====
# leapin require
#  - input/protein.pdb
# tleap output
#  - output/system.dry.pdb
#  - output/system.pdb
#  - output/system.prmtop
#  - output/system.crd
#  - output/leap.log
tleap -f input/leapin &> log/leap_stdout.log
