{ pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./swaylock.nix
    ./zsh.nix
    ./tmux.nix
  ];
}