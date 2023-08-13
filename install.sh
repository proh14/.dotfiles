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
  nixpkgs.neofetch \
  nixpkgs.libgccjit \
  nixpkgs.unzip

# Stow all files
stow --adopt .

# Configure zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"
antibody bundle < ~/.zsh/.zpluginst > ~/.zsh/.zplugins

# Install tpm for tmux
rm -rf ~/.tmux/plugins/tpm  || true
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
. ~/.tmux/plugins/tpm/scripts/install_plugins.sh

#Configures neovim
nvim --headless +"Lazy sync" +"MasonInstallAll" +"TSUpdateSync" +qall

# Reset git for stow
git reset --hard
