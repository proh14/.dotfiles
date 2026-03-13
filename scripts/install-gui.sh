#!/bin/bash

# Install yay AUR helper if not installed
if ! command -v yay >/dev/null 2>&1; then
    echo "Installing yay..."

    sudo pacman -S --needed --noconfirm git base-devel

    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"

    (
        cd "$tmpdir/yay" || exit 1
        makepkg -si
    )

    rm -rf "$tmpdir"
fi

# Install packages using yay
echo "Installing GUI packages..."
yay -S --noconfirm --needed \
  catppuccin-gtk-theme-mocha \
  tela-circle-icon-theme-git \
  firefox \
  alacritty \
  xdg-utils \
  pipewire-audio \
  pipewire-pulse \
  pipewire-alsa \
  alsa-utils \
  feh \
  maim \
  wl-clipboard \
  jq \
  pamixer \
  colord \
  imagemagick \
  pwvucontrol \
  sway \
  swaybg \
  rofi \
