{ config, pkgs, pkgs-obsidian, user-attributes, inputs, ... }:

# beginning of theme management; need to pass from user-attributes and add themes as needed
let 
  theme = "tokyo-night";
  homePath = "/home/ianm1837";
  colors = user-attributes.colors;
  inherit user-attributes;

  custom-obsidian-desktop = pkgs.makeDesktopItem {
    categories = ["Office"];
    comment = "Knowledge base";
    icon = "obsidian";
    mimeTypes = ["x-scheme-handler/obsidian"];
    name = "obsidian wayland";
    desktopName = "Obsidian Wayland";
    exec = "${pkgs.obsidian}/bin/obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland";
  };
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
      custom-obsidian-desktop
      acpilight
      ranger
      fzf
      lazygit
      nixd
      nodePackages.typescript-language-server
      xorg.xeyes
      python3
      nodejs
      ruby
      steam-run
      neovim-unwrapped
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
