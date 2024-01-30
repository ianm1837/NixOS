{ config, pkgs, inputs, system, ... }:

let
  pkgs-obsidian = import inputs.obsidian-package {
    inherit system;
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
in
{
  services.flatpak.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless.enable = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    pciutils
    git
    gh
    distrobox
    vscode
    brave
    mattermost-desktop
    signal-desktop
    libreoffice-fresh
    libsForQt5.bismuth
    direnv
    moonlight-qt
    kitty 
    pkgs-obsidian.obsidian #custom package to fix OpenGL issue
    scribus
    unzip
    bun
    font-manager
    networkmanagerapplet
    killall
    qpwgraph
    wev
    hwinfo
    wlr-randr
    angryipscanner
    btop
    socat
    libGL # fix for obsidian
  ];

  fonts.packages = with pkgs; [
    font-awesome
    font-awesome_4
    font-awesome_5
    noto-fonts-color-emoji 
    material-icons
    symbola
    nerdfonts
  ];
}
