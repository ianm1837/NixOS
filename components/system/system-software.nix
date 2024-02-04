{ config, pkgs, pkgs-obsidian, pkgs-vscode-insiders, ... }:

{
  services.flatpak.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless.enable = true;
  };

  environment.systemPackages = let
    code-insiders = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
      src = (builtins.fetchTarball {
        url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
        sha256 = "0pk0iqmjpfa9qan6cy20af792k6d20029ms57ha26ca8i9r056ky";
      });
      version = "latest";
      buildInputs = oldAttrs.buildInputs ++ [ pkgs.krb5 ];
    });
  in (with pkgs; [
    code-insiders
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
    dmidecode
    usbutils
  ]);
}
