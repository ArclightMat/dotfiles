#!/bin/env bash
##### CHECK FOR SUDO or ROOT
if ! [ $(id -u) = 0 ]; then
  echo "This script must be run as sudo or root, try again..."
  exit 1
fi;

# Install Plasma5 + Hardware Support
dnf install -y \
  @"base-x" \
  @"Common NetworkManager Submodules" \
  @"Fonts" \
  @"Hardware Support" \
  adwaita-gtk2-theme \
  bluedevil \
  breeze-icon-theme \
  breeze-gtk \
  cagibi \
  colord-kde \
  cups-pk-helper \
  dolphin \
  firewall-config \
  glibc-all-langpacks \
  gnome-keyring-pam \
  kcm_systemd \
  kde-gtk-config \
  kde-partitionmanager \
  kde-print-manager \
  kde-settings-pulseaudio \
  kde-style-breeze \
  kdegraphics-thumbnailers \
  kdeplasma-addons \
  kdialog \
  kdnssd \
  kf5-akonadi-server \
  kf5-akonadi-server-mysql \
  kf5-baloo-file \
  kf5-kipi-plugins \
  khotkeys \
  kinfocenter \
  kmenuedit \
  konsole5 \
  kscreen \
  kscreenlocker \
  ksshaskpass \
  ksysguard \
  kwalletmanager5 \
  kwebkitpart \
  kwin \
  NetworkManager-config-connectivity-fedora \
  pam-kwallet \
  phonon-qt5-backend-gstreamer \
  pinentry-qt \
  plasma-breeze \
  plasma-desktop \
  plasma-desktop-doc \
  plasma-drkonqi \
  plasma-nm \
  plasma-nm-l2tp \
  plasma-nm-openconnect \
  plasma-nm-openswan \
  plasma-nm-openvpn \
  plasma-nm-pptp \
  plasma-nm-vpnc \
  plasma-pa \
  plasma-user-manager \
  plasma-workspace \
  plasma-workspace-geolocation \
  plasma-workspace-wayland \
  polkit-kde \
  qt5-qtbase-gui \
  qt5-qtdeclarative \
  sddm \
  sddm-breeze \
  sddm-kcm \
  setroubleshoot \
  sni-qt \
  system-config-language \
  xorg-x11-drv-libinput;

  
# Install useful KDE applications
dnf install -y \
  ark \
  gwenview \
  kate \
  kcalc \
  kcharselect \
  kvantum \
  okular \
  spectacle;

# Install Printing Support
dnf install -y @"Printing Support";

# Enable SDDM and start it up
systemctl enable sddm;
systemctl set-default graphical.target;
systemctl start graphical.target;
