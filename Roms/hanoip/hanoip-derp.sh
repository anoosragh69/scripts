# Build Script for hanoip

## Remove old repos
rm -rf prebuilts/clang/ prebuilts/rust/ .repo/local_manifests

## Clone the manifest repository
repo init --depth=1 -u https://github.com/DerpFest-AOSP/manifest.git -b 14

git clone https://github.com/anoosragh69/local_manifests-moto -b 14-hanoip-derp --depth 1 .repo/local_manifests

## Force sync the repository
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

rm -rf hardware/google/pixel hardware/qcom-caf/sm*
git clone https://github.com/anoosragh69/hardware_google_pixel -b 14 hardware/google/pixel
git clone https://github.com/moto-common/android_device_motorola_targets_include_headers device/motorola/targets/include/headers

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
