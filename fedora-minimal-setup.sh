#!/bin/env bash
##### CHECK FOR SUDO or ROOT
if ! [ $(id -u) = 0 ]; then
  echo "This script must be run as sudo or root, try again..."
  exit 1
fi

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
  xorg-x11-drv-libinput

  
# Install useful KDE applications
dnf install -y \
kate \
ark \
kcalc \
kcharselect \
krita \
gwenview \
spectacle \
okular \
kvantum

# Enable RPMFusion
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable VSCodium
rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" | tee -a /etc/yum.repos.d/vscodium.repo

# Install Flatpak + Flathub
dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Printing Support
dnf install -y @"Printing Support"

# Install Fonts
dnf install -y \
google-noto-emoji-fonts \
jetbrains-mono-fonts

# Install everyday applications
dnf install -y \
chromium-browser-privacy \
codium \
compat-ffmpeg28 \
discord \
ffmpeg \
firefox \
libreoffice \
mpv \
steam \
torbrowser-launcher \
vim \
wine \
winetricks \
youtube-dl

# Purge PackageKit
dnf remove -y PackageKit

# Fix Plymouth
plymouth-set-default-theme -R bgrt

# Enable SDDM and start it up
systemctl enable sddm
systemctl set-default graphical.target
systemctl start graphical.target
