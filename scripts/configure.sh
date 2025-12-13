#!/bin/bash


# Stow all files (copy the dotfiles to home)
echo "Stowing dotfiles..."
(
	cd ..
	stow alacritty awesomewm emacs fonts git lazygit mc mutt nvim tmux vim zsh
)

# Configure zsh
echo "Configuring zsh..."
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"
antibody bundle < ~/.config/.zsh/.zpluginst > ~/.config/.zsh/.zplugins

#Configures neovim
echo "Configuring neovim..."
nvim --headless +"Lazy sync" +"MasonInstallAll" +"TSUpdateSync" +qall

#Configures mc
echo "Configuring mc..."
mkdir -p "$HOME/.local/share/mc/skins" && cd "$HOME/.local/share/mc/skins" && git clone https://github.com/catppuccin/mc.git && ln -s -f ./mc/catppuccin.ini .


# Install tpm for tmux
echo "Configuring tmux..."
rm -rf ~/.tmux/plugins/tpm  || true
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
. ~/.tmux/plugins/tpm/scripts/install_plugins.sh
