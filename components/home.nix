{ config, pkgs, ... }:


let
  theme = "tokyo-night";
  homePath = "/home/ianm1837";
in
{ 
  imports = [
    ./themes/${theme}.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    stateVersion = "23.11"; # no touch
    username = "ianm1837";
    homeDirectory = "${homePath}";
    packages = [];
    file = {};
  };
}
