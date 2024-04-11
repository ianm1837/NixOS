{ pkgs, nixpkgs, ... }: {

  imports = [
    ./nix-alien.nix
  ];

  nixpkgs.config.allowUnfree = true;

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      rootless.enable = true;
    };
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  services = {
    flatpak.enable = true;
    openssh.enable = true;
    printing.enable = true;
    dbus.enable = true;
    blueman.enable = true;
    passSecretService.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
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
    virt-manager.enable = true;
    zsh.enable = true;
    adb.enable = true;
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
    systemPackages = with pkgs; [
      vscode
      wget
      pciutils
      git
      gh
      google-chrome
      distrobox
      unzip
      killall
      qpwgraph
      hwinfo
      socat
      usbutils
      python3
      obsidian
      jq
      curl
      wireguard-tools
      sshfs
      stow
      tmux
      speedtest-cli
      hyprpaper
      mattermost-desktop
      signal-desktop
      angryipscanner
      btop
      # moonlight-qt # package is broken, installed with flatpak
      lazygit
      lazydocker
      neovide
      alacritty
      nil
      ripgrep
      android-tools
      drawio
      syncthingtray
      syncthing
      resilio-sync
      filezilla
      # virtualization tools
      spice
      spice-gtk
      spice-protocol
      virt-viewer
    ];
  };

  users.users.ianm1837 = {
    isNormalUser = true;
    description = "ianm1837";
    extraGroups = [ "networkmanager" "wheel" "docker" "video" "adbusers" "libvirtd" ];
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
