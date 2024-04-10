{ pkgs, ... }: {

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless.enable = true;
  };

  services = {
    flatpak.enable = true;
    openssh.enable = true;
    printing.enable = true;
    blueman.enable = true;
    passSecretService.enable = true;
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

  programs = {
    hyprland.enable = true;
    zsh.enable = true;
    adb.enable = true;
    auto-cpufreq.enable = true;
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
  
  environment.systemPackages = with pkgs; [
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
  ];

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

  sound.enable = true;
  security.rtkit.enable = true; #realtime kit. Hardware scheduling for audio

  # system settings

  system.stateVersion = "23.11"; #no touch

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  time.timeZone = "America/Los_Angeles";

  environment.systemPackages = with pkgs; [
    adwaita-qt
  ];

  environment.sessionVariables = {
    QT_STYLE_OVERRIDE = "adwaita-dark";
  };

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
