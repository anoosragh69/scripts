# Build Script for hanoip

## Remove local_manifests directory
rm -rf .repo/local_manifests

## Clone the manifest repository
repo init --depth=1 --no-repo-verify -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen --git-lfs -g default,-mips,-darwin,-notdefault

git clone https://github.com/anoosragh69/local_manifests-moto -b 14-pos --depth 1 .repo/local_manifests

## Force sync the repository
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

## Install ccache
sudo apt update
sudo apt install ccache -y

## Set up the build environment
source build/envsetup.sh

export BUILD_HOSTNAME=crave
export BUILD_USERNAME=anoosragh69

# Apply sepolicy patch
sudo ./device/motorola/targets/scripts/replace_camera_sepolicy.sh

# Lunch for hanoip device
lunch aosp_hanoip-userdebug

# Build for hanoip device
mka bacon
