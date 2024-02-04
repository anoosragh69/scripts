# Build Script for hanoip

## Nuke old source
rm -rf .repo
rm -rf *

## Sync arrow
repo init --depth=1 --no-repo-verify -u https://github.com/ArrowOS/android_manifest.git -b arrow-13.1 --git-lfs -g default,-mips,-darwin,-notdefault

## Remove local_manifests directory
rm -rf .repo/local_manifests

## Clone the manifest repository
git clone https://github.com/anoosragh69/local_manifests-moto -b 13-arrow --depth 1 .repo/local_manifests

## Force sync the repository
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

## Install ccache
sudo apt update
sudo apt install ccache -y

## Set up the build environment
source build/envsetup.sh

## Apply sepolicy patch
sudo ./device/motorola/targets/scripts/replace_camera_sepolicy.sh

## Lunch for hanoip device
lunch arrow_hanoip-userdebug

## Build for hanoip device
mka bacon
