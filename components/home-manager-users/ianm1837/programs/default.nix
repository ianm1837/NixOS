{ pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
  ];
}