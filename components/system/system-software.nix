{ config, pkgs, pkgs-obsidian, pkgs-vscode-insiders, ... }:

{
  #services.flatpak.enable = true;
  # services.kmscon.enable = true;
  # services.kmscon.fonts = [
  #   { name = "JetBrainsMono NFM Regular"; package = pkgs.nerdfonts;}
  # ];
  # services.kmscon.extraConfig = "font-size=16";
  # services.kmscon.hwRender = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless.enable = true;
  };

  environment.systemPackages = let
#    code-insiders = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
 #     src = (builtins.fetchTarball {
  #      url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
   #     sha256 = "0pk0iqmjpfa9qan6cy20af792k6d20029ms57ha26ca8i9r056ky";
    #  });
     # version = "latest";
      #buildInputs = oldAttrs.buildInputs ++ [ pkgs.krb5 ];
    #});
  in (with pkgs; [
    nixos-bgrt-plymouth
#    code-insiders
    vscode
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
    python3
    jq
  ]);

  fonts.packages = [
    pkgs.font-awesome
    pkgs.font-awesome_4
    pkgs.font-awesome_5
    pkgs.noto-fonts-color-emoji 
    pkgs.material-icons
    pkgs.symbola
    pkgs.nerdfonts
  ];
}
