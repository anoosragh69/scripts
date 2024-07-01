#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018 Raphiel Rollerscaperers (raphielscape)
# Copyright (C) 2018 Rama Bndan Prakoso (rama982)

date=$(date +"%Y%m%d-%H%M")
ver=v2.5

# Clone Anykernel
git clone https://github.com/anoosragh69/AnyKernel3

# Zip Image
gzip out/target/product/hanoip/obj/KERNEL_OBJ/arch/arm64/boot/Image

# Move files to anykernel
cp -f out/target/product/hanoip/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz AnyKernel3/Image.gz
cp -f out/target/product/hanoip/obj/KERNEL_OBJ/arch/arm64/boot/dts/qcom/sdmmagpie-hanoi-base.dtb AnyKernel3/dtb
cp -f out/target/product/hanoip/dtbo.img AnyKernel3/dtbo.img

# Zip kernel
cd AnyKernel3
zip -r9 meteora-hanoip.zip * -x .git README.md .github LICENSE

# Sign zip file
curl -sLo zipsigner-3.0.jar https://github.com/Magisk-Modules-Repo/zipsigner/raw/master/bin/zipsigner-3.0-dexed.jar
java -jar zipsigner-3.0.jar meteora-hanoip.zip "meteora-$ver-$date-signed.zip"

# Upload kernel
ksau upload meteora-v* Public
