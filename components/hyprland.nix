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
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs = {
    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [thunar-archive-plugin thunar-volman thunar-media-tags-plugin tumbler];
    file-roller.enable = true;
  };

  services.gvfs.enable = true;
  services.samba.enable = true;
}