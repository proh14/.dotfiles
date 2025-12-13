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
  catppuccin-cursors-mocha \
  firefox \
  alacritty \
  picom \
  rofi \
  awesome \
