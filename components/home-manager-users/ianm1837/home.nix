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
    #./services/default.nix
    #./wayland.windowManager/${user-attributes.desktop-environment}.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface".show-battery-percentage = true;
    "org/gnome/desktop/interface".clock-format = "12h";
    "org/gnome/desktop/wm/preferences".focus-mode = "mouse";
    "org/gnome/desktop/wm/preferences".resize-with-right-button = true;
    "org/gnome/desktop/wm/keybindings".close = ["<Super>q"];
    "org/gnome/shell/keybindings".show-screenshot-ui = ["<Super><Shift>s"];
    "org/gnome/shell".enabled-extensions = [
      "forge@jmmaranan.com"
    ];
    "org/gnome/shell/extensions/forge/keybindings".window-toggle-float = ["<Super>f"];
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "/usr/bin/env kitty";
      name = "Launch Kitty";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>b";
      command = "/usr/bin/env brave";
      name = "Launch Brave";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>c";
      command = "/usr/bin/env code-insiders";
      name = "Launch Code";
    };
    
    "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
    ];
  };

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
      dconf2nix
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
