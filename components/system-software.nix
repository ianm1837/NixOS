{ config, pkgs, pkgs-obsidian, ... }:

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
    pkgs-obsidian.obsidian
    scribus
    waybar
    dunst
    libnotify
    rofi-wayland
    kanshi
    unzip
    blueman
    bun
    font-manager
    networkmanagerapplet
    killall
    blueman
    libpulseaudio
    pavucontrol
    gnome.gnome-keyring
    swww
    waypaper
    nwg-look
    gtk3
    gtk4
    tokyo-night-gtk
    gvfs
    gnome.dconf-editor
    xfce.thunar-archive-plugin
    polkit-kde-agent
    hyprpicker
    grim
    slurp
    wl-clipboard
    qpwgraph
    wlogout
    swaylock-effects
    wev
    hwinfo
    nwg-displays
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
