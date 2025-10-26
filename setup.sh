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
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES=$(grep -v '^#' "$SCRIPT_DIR/packages/packages.list" | grep -v '^$' | tr '\n' ' ')
sudo pacman -S $PACKAGES

# Install yay
echo -e "Installing yay & prefered packages\n"
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si
cd .. && rm -rf yay

AUR_PACKAGES=$(grep -v '^#' "$SCRIPT_DIR/packages/aur-packages.list" | grep -v '^$' | tr '\n' ' ')
yay -S $AUR_PACKAGES

# Install Brother MFC-L2800DW Printer
git clone https://github.com/penglezos/brother-mfc-l2800dw && cd brother-mfc-l2800dw
makepkg --install

# If device is a laptop install necessary packages
if [ -d "/proc/acpi/button/lid" ]; then
    echo -e "Installing packages for laptop...\n"
    LAPTOP_PACKAGES=$(grep -v '^#' "$SCRIPT_DIR/packages/laptop-packages.list" | grep -v '^$' | tr '\n' ' ')
    sudo pacman -S $LAPTOP_PACKAGES
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
