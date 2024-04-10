{
  # config,
  pkgs,
  pkgs-obsidian,
  user-attributes,
  inputs,
  ...
}:
# beginning of theme management; need to pass from user-attributes and add themes as needed
let
  theme = "tokyo-night";
  homePath = "/home/ianm1837";
  # colors = user-attributes.colors;
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
in {
  imports = [
    ./themes/${theme}.nix
    ./programs/default.nix
    ./wayland.windowManager/${user-attributes.desktop-environment}.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;
  };

  home = {
    stateVersion = "23.11"; # no touch
    username = "ianm1837";
    sessionVariables = {
      NIX_OZONE_WL = "1";
    };
    homeDirectory = "${homePath}";
    sessionPath = ["${homePath}/.local/bin"];
    packages = with pkgs; [
      brave
      mattermost-desktop
      signal-desktop
      angryipscanner
      btop
      scribus
      # moonlight-qt
      pkgs-obsidian.obsidian #custom package to fix OpenGL issue
      custom-obsidian-desktop
      acpilight
      ranger
      lazygit
      lazydocker
      xorg.xeyes
      neovide
      alacritty
      nil
      alejandra
      ripgrep
      android-tools
      swayidle
      swaybg
      freecad
      drawio
      syncthingtray
      syncthing
      resilio-sync
      filezilla
    ];

    # config files that don't make sense to configure with nix
    # ---- These are now managed with stow
    file = {
      ".config" = {
        enable = false;
        source = ./config;
        recursive = true;
      };
    };
  };
}
