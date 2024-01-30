{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables ={
    NIX_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  programs = {
    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [thunar-archive-plugin thunar-volman thunar-media-tags-plugin tumbler];
    file-roller.enable = true;
  };

  services.gvfs.enable = true;
  services.samba.enable = true;

  environment.systemPackages = with pkgs; [
    dunst
    libnotify
    rofi-wayland
    kanshi
    blueman
    pavucontrol
    libpulseaudio
    gnome.gnome-keyring
    swww
    waypaper
    # nwg-look
    gtk3
    gtk4
    # tokyo-night-gtk
    # gvfs
    # gnome.dconf-editor
    # xfce.thunar-archive-plugin
    polkit-kde-agent
    hyprpicker
    grim
    slurp
    wl-clipboard
    wlogout
    swaylock-effects
    waybar
  ];
}