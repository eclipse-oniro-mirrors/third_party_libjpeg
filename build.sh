#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2020. All rights reserved.

set -e
OUT_DIR=$1
ROOT_DIR=$(dirname "$0")

git checkout -- configure
git apply huawei_libjpeg_patch1.patch

./configure CC=$ROOT_DIR/../../prebuilts/gcc/linux-x86/arm/arm-linux-harmonyeabi-gcc/bin/arm-linux-ohoseabi-gcc --host=arm-linux

make clean
make -j
$ROOT_DIR/../../prebuilts/gcc/linux-x86/arm/arm-linux-harmonyeabi-gcc/arm-linux-ohoseabi/bin/strip $ROOT_DIR/.libs/libjpeg.so
cp $ROOT_DIR/.libs/libjpeg.so $OUT_DIR/libjpeg.so
