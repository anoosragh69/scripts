#!/bin/bash

# Set up environment

. build/envsetup.sh

# Use ccache

export USE_CCACHE=1

# Lunch

read -p "Enter device codename: " device
read -p "Enter rom name: " rom
read -p "Build type [eng, user, userdebug]: " type
lunch ${rom}!_${device}!-${type}!

# Build

m bacon
