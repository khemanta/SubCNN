#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

LOG="experiments/logs/imagenet3d_caffenet_rpn_msr_test_1.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time ./tools/test_net.py --gpu $1 \
  --def models/CaffeNet/imagenet3d/test_rpn_msr.prototxt \
  --net output/imagenet3d/imagenet3d_trainval/caffenet_fast_rcnn_rpn_msr_imagenet3d_iter_160000.caffemodel \
  --imdb imagenet3d_test_1 \
  --cfg experiments/cfgs/imagenet3d_rpn_msr.yml
