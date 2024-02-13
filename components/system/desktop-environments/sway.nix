{ config, pkgs, inputs, lib, ... }: 

# let
#   flake-compat = builtins.fetchTarball {
#     url = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
#     sha256 = "sha256:0m9grvfsbwmvgwaxvdzv6cmyvjnlww004gfxjvcl806ndqaxzy4j";
#   };

#   hyprland-flake = (import flake-compat {
#     src = builtins.fetchTarball {
#       url = "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
#       sha256 = "sha256:1azcab634qfqg5mww2qzccp07c73066wziq6h78dnzwg6wsq7m1p";
#     };
#   }).defaultNix;
# in 

{
  environment.sessionVariables.NIX_OZONE_WL = "1";
  hardware.opengl.enable = true;

  security.polkit.enable = true;
  programs.dconf.enable = true;
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    config.common.default = "*";
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
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
    # xserver.enable = true;
    # xserver.displayManager.sddm = {
    #  enable = false;
    #  wayland.enable = true;
    #  };
    #};
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
    gnome.dconf-editor
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
