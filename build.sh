#!/bin/sh
echo
#export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm

CPU_JOB_NUM=$(grep processor /proc/cpuinfo | awk '{field=$NF};END{print field+1}')
#CPU_JOB_NUM=1
make distclean
echo make distclean done!!!
make smdk4412_config
echo make smdk4412_config  board configuration done!

export RELEASE_DIR=./deploy

echo buiding !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo make -j$CPU_JOB_NUM
make -j$CPU_JOB_NUM


echo
echo "Copying..."$RELEASE_DIR
cp -f u-boot.bin $RELEASE_DIR/u-boot.bin
cp -f bl2.bin $RELEASE_DIR/bl2.bin
echo
