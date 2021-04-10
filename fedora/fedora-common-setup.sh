#!/bin/env bash
##### CHECK FOR SUDO or ROOT
if ! [ $(id -u) = 0 ]; then
  echo "This script must be run as sudo or root, try again..."
  exit 1
fi;

# Enable RPMFusion
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;

# Enable VSCode
rpm --import https://packages.microsoft.com/keys/microsoft.asc;
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo;

# Install Flatpak + Flathub
dnf install -y flatpak;
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;

# Install Fonts
dnf install -y \
  google-noto-emoji-fonts \
  jetbrains-mono-fonts;

# Install everyday applications
dnf install -y \
  chromium-browser-privacy \
  compat-ffmpeg28 \
  code \
  discord \
  ffmpeg \
  firefox \
  gparted \
  krita \
  libreoffice \
  mpv \
  qbittorrent \
  steam \
  torbrowser-launcher \
  vim \
  virt-manager \
  wine \
  winetricks \
  youtube-dl;

# Install themes
dnf install -y \
  papirus-icon-theme

# Purge PackageKit
dnf remove -y PackageKit;

# Fix Plymouth
plymouth-set-default-theme -R bgrt;

