# Build Script for hanoip

## Remove old repos
rm -rf prebuilts/clang/ prebuilts/rust/ .repo

## Clone the manifest repository
repo init --depth=1 -u https://github.com/yaap/manifest.git -b fourteen --git-lfs

git clone https://gitlab.com/anoosragh69/local_manifests.git -b yaap-hanoip --depth 1 .repo/local_manifests

## Force sync the repository
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

## Install ccache
sudo apt update
sudo apt install ccache -y

## Set up the build environment
source build/envsetup.sh

export BUILD_HOSTNAME=mtrixfuker
export BUILD_USERNAME=anoosragh69

## Lunch for hanoip device
lunch yaap_hanoip-userdebug

## Build for hanoip device
m yaap
