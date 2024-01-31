{ config, pkgs, pkgs-obsidian, pkgs-vscode-insiders, ... }:

{
  services.flatpak.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    pciutils
    git
    gh
    distrobox
    libreoffice-fresh
    libsForQt5.bismuth
    direnv
    kitty 
    unzip
    killall
    qpwgraph
    wev
    hwinfo
    socat
    libGL # fix for obsidian
  ];
}
