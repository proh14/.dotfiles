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
  nerd-fonts-fira-code \
  catppuccin-gtk-theme-mocha \
  tela-circle-icon-theme-git \
  firefox \
  alacritty \
  picom-git \
  rofi \
  awesome \
  mpc \
  playerctl \
  ncmpcpp \
  mpd \
  xdg-utils \
  pipewire \
  pipewire-pulse \
  pipewire-alsa \
  alsa-utils \
  feh \
  maim \
  xclip \
  jq \
  pamixer \
  colord \
  mpdris2 \
  imagemagick \
  inotify-tool \
  pavucontrol \
  thunar \


# Enable and start MPD and mpDris2 services
echo "Enabling and starting MPD and mpDris2 services..."
systemctl --user enable mpd.service
systemctl --user start mpd.service
systemctl --user enable mpDris2.service
systemctl --user start mpDris2.service
