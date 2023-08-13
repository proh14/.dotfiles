#!/bin/bash
# Install nix
if [ ! -f ~/.nix-profile/etc/profile.d/nix.sh ]; then
curl -L https://nixos.org/nix/install | sh
fi
. ~/.nix-profile/etc/profile.d/nix.sh
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

# Stow all files
stow --adopt .

# Configure zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"
antibody bundle < ~/.zsh/.zpluginst > ~/.zsh/.zplugins

# Install tpm for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.config/tmux/tmux.conf
# Reset git for stow
git reset --hard
