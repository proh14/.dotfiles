# Set XDG Base Directories
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# XDG directories for specific applications
# https://wiki.archlinux.org/title/XDG_Base_Directory
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export DISCORD_USER_DATA_DIR="${XDG_DATA_HOME}"
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
if [ ! -d "$XDG_DATA_HOME/wineprefixes" ]; then
    mkdir -p "$XDG_DATA_HOME/wineprefixes"
fi
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc, export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc


# Set environment variables
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GPG_TTY=$(tty)
export MANPAGER="nvim +Man!"
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export TERM=alacritty
export EDITOR="nvim"


# Set Zsh configuration directory
export ZDOTDIR=$HOME/.config/zsh
