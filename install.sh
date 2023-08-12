#!/bin/bash
# Install nix
bash <(curl -L https://nixos.org/nix/install) --daemon

bash
# Install all the needed packages
nix-env -iA \
  nixpkgs.neovim \
  nixpkgs.git \
  nixpkgs.exa \
  nixpkgs.emacs \
  nixpkgs.bat \
  nixpkgs.fzf \
  nixpkgs.zsh \
  nixpkgs.tmux \
  nixpkgs.stow \
  nixpkgs.vifm \
  nixpkgs.antibody \
  nixpkgs.dwt1-shell-color-scripts \
  nixpkgs.neofetch

# Configure zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"
antibody bundle < ~/.zpluginst > ~/.zplugins

# Stow all files
stow --adopt .
