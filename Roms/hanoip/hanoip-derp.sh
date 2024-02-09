# Build Script for hanoip

## Remove local_manifests directory
rm -rf .repo/local_manifests

## Clone the manifest repository
repo init --depth=1 -u https://github.com/DerpFest-AOSP/manifest.git -b 14

git clone https://github.com/anoosragh69/local_manifests-moto -b 14-hanoip-derp --depth 1 .repo/local_manifests

## Force sync the repository
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

## Install ccache
sudo apt update
sudo apt install ccache -y

## Set up the build environment
source build/envsetup.sh

## Apply sepolicy patch
sudo ./device/motorola/targets/scripts/replace_camera_sepolicy.sh

export BUILD_HOSTNAME=crave
export BUILD_USERNAME=istg32
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

## Lunch for hanoip device
lunch derp_hanoip-userdebug

## Build for hanoip device
mka derp
