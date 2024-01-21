# Build Script for hanoip

# Remove local_manifests directory
rm -rf .repo/local_manifests

# Clone the manifest repository
git clone https://github.com/anoosragh69/local_manifests-moto -b 13-rhodep-derpfest --depth 1 .repo/local_manifests

# Force sync the repository
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Install ccache
sudo apt update
sudo apt install ccache -y

# Set up the build environment
source build/envsetup.sh

# Lunch for CPH1859 device
lunch derp_rhodep-userdebug

# Build for CPH1859 device
m updatepackage
