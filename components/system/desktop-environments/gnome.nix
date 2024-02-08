{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = [
    pkgs.gnomeExtensions.forge
    pkgs.gnomeExtensions.dash-to-dock
    pkgs.gnomeExtensions.no-overview
    pkgs.gnome.dconf-editor
    pkgs.rofi-wayland
  ];

  programs.dconf.enable = true;

  programs.dconf.profiles = {
    user.databases = [{
      settings = with lib.gvariant; {};
    }];
  };
}