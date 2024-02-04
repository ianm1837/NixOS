{ config, pkgs, ... }:

{
  environment.sessionVariables.NIX_OZONE_WL = "1";
  hardware.opengl.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  systemd.services.change-acpi-wakup-perms = {
    enable = true;
    description = "Change permissoins of /proc/acpi/wakeup";
    unitConfig = {
    };
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [
        ""
        "/run/current-system/sw/bin/chmod 0666 /proc/acpi/wakeup"
        "/run/current-system/sw/bin/bash -c 'echo XHC0 > /proc/acpi/wakeup'"
        "/run/current-system/sw/bin/bash -c 'echo XHC1 > /proc/acpi/wakeup'"
      ];
      RemainAfterExit = "yes";
    };
    wantedBy = [ "multi-user.target" ];
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

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
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
    grimblast
    wl-clipboard
    wlogout
    waybar
    networkmanagerapplet
    wlr-randr
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