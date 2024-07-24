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
  nixpkgs.emacs \
  nixpkgs.bat \
  nixpkgs.fzf \
  nixpkgs.zsh \
  nixpkgs.tmux \
  nixpkgs.stow \
  nixpkgs.antibody \
  nixpkgs.dwt1-shell-color-scripts \
  nixpkgs.neofetch \
  nixpkgs.unzip \
  nixpkgs.mc \
  nixpkgs.lazygit \
  nixpkgs.neomutt \
  nixpkgs.polybar \
  nixpkgs.bspwm \
  nixpkgs.dunst \
  nixpkgs.sxhkd \
  nixpkgs.rofi \
  nixpkgs.nitrogen \
  nixpkgs.alacritty \
  nixpkgs.picom \
  nixpkgs.catppuccin-gtk \
  nixpkgs.catppuccin-cursors.mochaMauve


# Stow all files
stow --adopt .

# Reset git for stow
git reset --hard

# Configure zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"
antibody bundle < ~/.zsh/.zpluginst > ~/.zsh/.zplugins

#Configures neovim
nvim --headless +"Lazy sync" +"MasonInstallAll" +"TSUpdateSync" +qall

#Configures mc
mkdir -p $HOME/.local/share/mc/skins && cd $HOME/.local/share/mc/skins && git clone https://github.com/catppuccin/mc.git && ln -s -f ./mc/catppuccin.ini .


# Install tpm for tmux
rm -rf ~/.tmux/plugins/tpm  || true
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
. ~/.tmux/plugins/tpm/scripts/install_plugins.sh
