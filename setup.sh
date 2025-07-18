#!/bin/bash
#
# Copyright (C) 2022-2025 Panagiotis Englezos <panagiotisegl@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#
# Script to setup Arch Linux personal configuration
#

# Install necessary packages
echo -e "Installing packages...\n"
sudo pacman -S \
    android-tools \
    android-udev \
    audacity \
    base-devel \
    blueman \
    bluez \
    bluez-utils \
    cups \
    cups-pdf \
    fastfetch \
    filezilla \
    firefox \
    gcc \
    gedit \
    ghostty \
    gimp \
    git \
    git-lfs \
    github-cli \
    gnome-tweaks \
    gparted \
    htop \
    hugo \
    inkscape \
    inter-font \
    jq \
    keepassxc \
    krita \
    libreoffice-still \
    mission-center \
    nodejs \
    noto-fonts \
    npm \
    ntfs-3g \
    obsidian \
    obs-studio \
    openrgb \
    pacman-contrib \
    power-profiles-daemon \
    powertop \
    telegram-desktop \
    ttf-roboto \
    unrar \
    veracrypt \
    virtualbox \
    wget \
    wireshark-qt \
    zram-generator

# Install yay
echo -e "Installing yay & prefered packages\n"
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si
cd .. && rm -rf yay

yay -S \
    android-apktool \
    android-sdk \
    android-studio \
    aosp-devel \
    balena-etcher \
    downgrade \
    extension-manager \
    google-chrome \
    lineageos-devel \
    local-by-flywheel-bin \
    onlyoffice-bin \
    polychromatic \
    refine \
    spotify \
    stremio \
    ttf-ms-win11-auto \
    ttf-poppins \
    ventoy-bin \
    visual-studio-code-bin

# Install Brother MFC-L2800DW Printer
git clone https://github.com/penglezos/brother-mfc-l2800dw && cd brother-mfc-l2800dw
makepkg --install

# If device is a laptop install necessary packages
if [ -d "/proc/acpi/button/lid" ]; then
    echo -e "Installing packages for laptop...\n"
    sudo pacman -S \
        tlp
fi

# Enable bluetooth service
echo -e "Enabling bluetooth service...\n"
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# Enable printer service
echo -e "Enabling printer service...\n"
sudo systemctl enable cups.service
sudo systemctl start cups.service

# Git profile configuration
echo -e "Configuring git profile...\n"
git config --global user.name "penglezos"
git config --global user.email "panagiotisegl@gmail.com"
git config --global review.review.lineageos.org.username "englezos"

# Git alias configuration
echo -e "Configuring git alias shortcuts...\n"
git config --global alias.cp 'cherry-pick'
git config --global alias.r 'revert'
git config --global alias.rc 'revert --no-commit'
git config --global core.editor "nano"
