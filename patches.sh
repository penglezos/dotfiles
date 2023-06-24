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

# frameworks_base
cd frameworks/base
git fetch https://github.com/EnglezosAOSP/android_frameworks_base
git cherry-pick b461c33^..6d509e9
cd ../../

# Settings
cd packages/apps/Settings
git fetch https://github.com/EnglezosAOSP/android_packages_apps_Settings
git cherry-pick 74cb3d8
cd ../../

# Connectivity
cd packages/modules/Connectivity
git fetch https://github.com/EnglezosAOSP/android_packages_modules_Connectivity/
git cherry-pick 1113fdb
cd ../../

# Wifi
cd packages/modules/Wifi
git fetch https://github.com/EnglezosAOSP/android_packages_modules_Wifi
git cherry-pick 6d8e04a^..f345355

# system_core
cd system/core
git fetch https://github.com/EnglezosAOSP/android_system_core
git cherry-pick a7d5e6e^..b023047