# Build Script for hanoip

## Remove old repos
rm -rf .repo/local_manifests packages hardware lineage-sdk external frameworks

## Clone the manifest repository
repo init --depth=1 --no-repo-verify -u https://github.com/yaap/manifest.git -b fourteen --git-lfs -g default,-mips,-darwin,-notdefault

git clone https://gitlab.com/anoosragh69/local_manifests.git -b yaap-hanoip --depth 1 .repo/local_manifests

## Force sync the repository
/opt/crave/resync.sh

## Install ccache
sudo apt update
sudo apt install ccache -y

## Set up the build environment
source build/envsetup.sh

export BUILD_HOSTNAME=mtrixfuker
export BUILD_USERNAME=anoosragh69

## Lunch for hanoip device
lunch yaap_hanoip-ap1a-userdebug

## Build for hanoip device
m yaap
