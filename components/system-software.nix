{ config, pkgs, ... }:

{
  services.flatpak.enable = true;
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  environment.systemPackages = with pkgs; [
    kate
    firefox
    neovim
    wget
    pciutils
    git
    distrobox
    docker
    vscode
    brave
    mattermost-desktop
    signal-desktop
    libreoffice-fresh
    libsForQt5.bismuth
    direnv
    moonlight-qt
    kitty 
    obsidian
    scribus
  ];
}
