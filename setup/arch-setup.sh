#!/bin/bash

# Install necessary packages
echo -e "Installing packages...\n"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
PACKAGE_DIR="$REPO_ROOT/setup/packages/arch"
PACKAGES=$(grep -v '^#' "$PACKAGE_DIR/packages.list" | grep -v '^$' | tr '\n' ' ')
sudo pacman -S $PACKAGES

# Install yay
echo -e "Installing yay & prefered packages\n"
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si
cd .. && rm -rf yay

AUR_PACKAGES=$(grep -v '^#' "$PACKAGE_DIR/aur-packages.list" | grep -v '^$' | tr '\n' ' ')
yay -S $AUR_PACKAGES

# Install Brother MFC-L2800DW Printer
git clone https://github.com/penglezos/brother-mfc-l2800dw && cd brother-mfc-l2800dw
makepkg --install

# If device is a laptop install necessary packages
if [ -d "/proc/acpi/button/lid" ]; then
    echo -e "Installing packages for laptop...\n"
    LAPTOP_PACKAGES=$(grep -v '^#' "$PACKAGE_DIR/laptop-packages.list" | grep -v '^$' | tr '\n' ' ')
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
