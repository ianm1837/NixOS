{
  # config,
  # inputs,
  pkgs,
  # pkgs-obsidian,
  # pkgs-vscode-insiders,
  ...
}: {
  # hardware rendered terminal. Doesn't appear to be compatible with running sway
  #
  # services.kmscon.enable = true;
  # services.kmscon.fonts = [
  #   { name = "JetBrainsMono NFM Regular"; package = pkgs.nerdfonts;}
  # ];
  # services.kmscon.extraConfig = "font-size=16";
  # services.kmscon.hwRender = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless.enable = true;
  };

  programs.hyprland.enable = true;

  programs.adb.enable = true;

  services.flatpak.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
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
    speedtest-cli
    pcmanfm-qt
    hyprpaper
    # (curl.overrideAttrs(oldAttrs: {configureFlags = oldAttrs.configureFlags ++ ["--with-ca-path=/etc/ssl/certs"];}))
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
}
