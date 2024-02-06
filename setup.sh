#!/bin/bash
#setup.sh: clones and sets up RPi Pico SDK

# I think you could use your own SDK version from elsewhere on your disk, but
# use this if that doesn't work out.

git clone https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk
git submodule update --init --recursive
cmake .
make -j$(nproc --all) # Use all available cores for max speed
