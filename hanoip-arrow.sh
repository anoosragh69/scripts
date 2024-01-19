# Build Script for hanoip

repo init --depth=1 --no-repo-verify -u https://github.com/ArrowOS/android_manifest.git -b arrow-13.1 --git-lfs -g default,-mips,-darwin,-notdefault

# Remove local_manifests directory
rm -rf .repo/local_manifests

# Clone the manifest repository
git clone https://github.com/anoosragh69/local_manifests-moto -b 13-arrow --depth 1 .repo/local_manifests
# Force sync the repository
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Set up the build environment
source build/envsetup.sh

# Apply sepolicy patch
sudo ./device/motorola/targets/scripts/replace_camera_sepolicy.sh

# Lunch for CPH1859 device
lunch arrow_hanoip-userdebug

# Build for CPH1859 device
mka bacon
