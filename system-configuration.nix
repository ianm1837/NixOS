{ pkgs, nixpkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless.enable = true;
  };

  services = {
    flatpak.enable = true;
    openssh.enable = true;
    printing.enable = true;
    gvfs.enable = true;
    samba.enable = true;
    dbus.enable = true;
    blueman.enable = true;
    passSecretService.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.wayland.enable = true;
    xserver.libinput.enable = true;
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    udev.extraRules = ''
      SUBSYSTEM=="backlight", ACTION=="add", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness"
      SUBSYSTEM=="leds", ACTION=="add", KERNEL=="*::kbd_backlight", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/leds/%k/brightness", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/leds/%k/brightness"
    '';
  };

  systemd = {
    services = {
      change-acpi-wakup-perms = {
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
    };
  };

  programs = {
    hyprland.enable = true;
    zsh.enable = true;
    adb.enable = true;
    auto-cpufreq.enable = true;
    dconf.enable = true;
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
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        #list of misssing dynamic libraries
        alsa-lib
        at-spi2-atk
        at-spi2-core
        atk
        cairo
        cups
        curl
        dbus
        expat
        fontconfig
        freetype
        fuse3
        gdk-pixbuf
        glib
        gtk3
        icu
        libGL
        libappindicator-gtk3
        libdrm
        libglvnd
        libnotify
        libpulseaudio
        libunwind
        libusb1
        libuuid
        libxkbcommon
        libxml2
        mesa
        nspr
        nss
        openssl
        pango
        pipewire
        stdenv.cc.cc
        systemd
        vulkan-loader
        xorg.libX11
        xorg.libXScrnSaver
        xorg.libXcomposite
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXi
        xorg.libXrandr
        xorg.libXrender
        xorg.libXtst
        xorg.libxcb
        xorg.libxkbfile
        xorg.libxshmfence
        zlib
      ];
    };
  };

  environment = {

    sessionVariables = {
      QT_STYLE_OVERRIDE = "adwaita-dark";
    };

    systemPackages = with pkgs; [
      adwaita-qt
      bruno
      nixos-bgrt-plymouth
      dunst
      vscode
      wget
      pciutils
      git
      gh
      google-chrome
      distrobox
      libreoffice-fresh
      direnv
      kitty
      unzip
      killall
      qpwgraph
      wev
      hwinfo
      socat
      swayfx
      libGL # fix for obsidian
      dmidecode
      usbutils
      python3
      nodePackages.neovim
      nodePackages_latest.nodejs
      obsidian
      cargo
      gcc
      jq
      curl
      wireguard-tools
      sshfs
      stow
      tmux
      speedtest-cli
      pcmanfm-qt
      hyprpaper
      # sway related packages
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
      #packages from old home manager
      brave
      mattermost-desktop
      signal-desktop
      angryipscanner
      btop
      scribus
      # moonlight-qt # package is broken, installed with flatpak
      acpilight
      ranger
      lazygit
      lazydocker
      neovide
      alacritty
      nil
      alejandra
      ripgrep
      android-tools
      swayidle
      swaybg
      freecad
      drawio
      syncthingtray
      syncthing
      resilio-sync
      filezilla
    ];
  };

  users.users.ianm1837 = {
    isNormalUser = true;
    description = "ianm1837";
    extraGroups = [ "networkmanager" "wheel" "docker" "video" "adbusers" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  fonts.packages = [
    pkgs.font-awesome
    pkgs.font-awesome_4
    pkgs.font-awesome_5
    pkgs.noto-fonts-color-emoji
    pkgs.material-icons
    pkgs.symbola
    pkgs.nerdfonts
  ];

  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
    hostName = "nixos";
    wireguard.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
    opengl.enable = true;
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true; #realtime kit. Hardware scheduling for audio
    pam.services.swaylock = {
      text = ''
        auth include login
      '';
    };
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  sound.enable = true;

  system.stateVersion = "23.11"; #no touch

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    allowed-users = [
      "ianm1837"
    ];
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  time.timeZone = "America/Los_Angeles";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
}
