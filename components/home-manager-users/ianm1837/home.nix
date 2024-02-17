{ config, pkgs, pkgs-obsidian, user-attributes, inputs, ... }:

# beginning of theme management; need to pass from user-attributes and add themes as needed
let 
  theme = "tokyo-night";
  homePath = "/home/ianm1837";
  colors = user-attributes.colors;
  inherit user-attributes;
in
{ 
  imports = [
    ./themes/${theme}.nix
    ./programs/default.nix
    ./services/default.nix
    ./wayland.windowManager/${user-attributes.desktop-environment}.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    stateVersion = "23.11"; # no touch
    username = "ianm1837";
    homeDirectory = "${homePath}";
    packages = with pkgs; [
#      vscode
      brave
      mattermost-desktop
      signal-desktop
      angryipscanner
      btop
      bun
      scribus
      moonlight-qt
      pkgs-obsidian.obsidian #custom package to fix OpenGL issue
      acpilight
      ranger
      fzf
      lazygit
    ];

    # config files that don't make sense to configure with nix
    file = {
      ".config" = {
        source = ./config;
        recursive = true;
      };
    };
  };
}
