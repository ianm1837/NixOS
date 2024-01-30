{ config, pkgs, ... }:


let
  theme = "tokyo-night";
in
{ 
  imports = [
    "./themes/${theme}.nix"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    stateVersion = "23.11"; # no touch
    username = "ianm1837";
    homeDirectory = "/home/ianm1837";
    packages = [];
    file = {};

  };



}
