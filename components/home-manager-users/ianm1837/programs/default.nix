{ pkgs, ... }:

{
  imports = [
    ./swaylock.nix
    ./zsh.nix
    ./tmux.nix
  ];
}