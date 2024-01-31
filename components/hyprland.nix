{ config, pkgs, ... }:

{
  environment.sessionVariables.NIX_OZONE_WL = "1";
  hardware.opengl.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  programs = {
    
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin 
        thunar-volman 
        thunar-media-tags-plugin 
        tumbler
      ];
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    file-roller.enable = true;
  };

  services = {
    gvfs.enable = true;
    samba.enable = true;
  };

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
    gtk3
    gtk4
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