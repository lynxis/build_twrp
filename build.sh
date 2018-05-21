#!/bin/bash

BUILD_TWRP=$(pwd)

mkdir -p android/omni
cd android/omni

test -d .repo || repo init -u https://github.com/omnirom/android.git -b android-7.1
repo sync "-j5"
mkdir -p .repo/local_manifests
cp "$BUILD_TWRP/local_manifest.xml" .repo/local_manifests/local_manifest.xml

source build/envsetup.sh
lunch omni_eva-userdebug

mka recoveryimage

fastboot flash recovery out/target/product/eva/recovery.img
