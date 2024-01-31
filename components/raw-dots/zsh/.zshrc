
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/ianm1837/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
#
alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias h="Hyprland"

function list_all() {
    emulate -L zsh
    ls -a
}
chpwd_functions=(${chpwd_functions[@]} "list_all")

alias top="btop"
alias snr="sudo nixos-rebuild switch --flake ~/.dotfiles/flake.nix"
