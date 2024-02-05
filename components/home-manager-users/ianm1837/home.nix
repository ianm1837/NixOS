{ config, pkgs, pkgs-obsidian, user-attributes, ... }:

# beginning of theme management; need to pass from user-attributes and add themes as needed
let 
  theme = "tokyo-night";
  homePath = "/home/ianm1837";
  colors = user-attributes.colors;
in
{ 
  imports = [
    ./themes/${theme}.nix
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
      vscode
      brave
      mattermost-desktop
      signal-desktop
      angryipscanner
      btop
      bun
      scribus
      moonlight-qt
      pkgs-obsidian.obsidian #custom package to fix OpenGL issue
      neovim

    ];
    file = {
      ".config/hypr/scripts" = {
        source = ./raw-dots/hypr/scripts;
        recursive = true;
      };
      ".config/rofi" = {
        source = ./raw-dots/rofi;
        recursive = true;
      };
      ".config/waybar" = {
        source = ./raw-dots/waybar;
        recursive = true;
      };
      ".config/wlogout" = {
        source = ./raw-dots/wlogout;
        recursive = true;
      };
    };
  };
}
