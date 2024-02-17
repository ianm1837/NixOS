{ pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./swaylock.nix
    ./zsh.nix
    ./misc.nix
    ./neovim.nix
    ./tmux.nix
  ];
}