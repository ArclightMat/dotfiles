#!/bin/env bash
##### CHECK FOR SUDO or ROOT
if ! [ $(id -u) = 0 ]; then
  echo "This script must be run as sudo or root, try again..."
  exit 1
fi;


# Install GNOME utilities
dnf install -y \
  gnome-tweaks \
  gnome-shell-extension-appindicator \
  gnome-shell-extension-gamemode \
  gnome-shell-extension-gsconnect;
  
# Remove GNOME utilities I don't use
dnf remove -y \
  gnome-boxes \
  gnome-software \
  rhythmbox \
  totem;
