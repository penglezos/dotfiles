#!/bin/bash

# android_build
cd build/core
git fetch https://github.com/EnglezosAOSP/android_build/
git cherry-pick 5e9b696
cd ../../

# build_soong
cd build/soong
git fetch https://github.com/EnglezosAOSP/android_build_soong/
git cherry-pick 7e07da0^..82153b8
cd ../../

# vendor_lineage
cd vendor/lineage
git fetch https://github.com/EnglezosAOSP/android_vendor_lineage
git cherry-pick 25535f0
git cherry-pick 3198623
cd ../../