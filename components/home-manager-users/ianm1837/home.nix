{
  pkgs,
  pkgs-obsidian,
  user-attributes,
  inputs,
  ...
}:
let
  inherit user-attributes;

  custom-obsidian-desktop = pkgs.makeDesktopItem {
    categories = ["Office"];
    comment = "Knowledge base";
    icon = "obsidian";
    mimeTypes = ["x-scheme-handler/obsidian"];
    name = "obsidian wayland";
    desktopName = "Obsidian Wayland";
    exec = "${pkgs.obsidian}/bin/obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland";
  };
in {

  programs = {
    home-manager.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      package = pkgs.neovim-unwrapped;
    };
    zsh = {
      enable = true;
      shellAliases = {
        top = "btop";
        snr = "sudo nixos-rebuild switch --flake ~/git/nixos";
        v = "nvf";
        nvim = "nvf";
        vim = "nvf";
        vimdiff = "nvf";
        vi = "nvf";
        lg = "lazygit";
        ta = "tmux attach";
      };
      initExtra = ''
        function list_all() {
            emulate -L zsh
            ls -a
        }
        chpwd_functions=(''${chpwd_functions[@]} "list_all")

        nvf() {
          if [[ $# -eq 0 ]]; then
            nvim
          else
            nvim "$@"
          fi
        }

        export BUN_INSTALL="$HOME/.bun" 
        export PATH="$BUN_INSTALL/bin:$PATH" 

        # fix for miniflare/wrangler
        export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
      '';
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "sudo"
          "systemadmin"
          "docker"
          "docker-compose"
          "bun"
          "dotenv"
          "git"
          "vscode"
        ];
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.tokyo-night-gtk;
      name = "Tokyonight-Dark-B";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    font = {
      name = "Sans";
      size = 11;
    };
  };

  home = {
    stateVersion = "23.11"; # no touch
    username = "ianm1837";
    sessionVariables = {
      NIX_OZONE_WL = "1";
    };
    homeDirectory = "/home/ianm1837";
    sessionPath = ["/home/ianm1837/.local/bin"];
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    packages = with pkgs; [
      brave
      mattermost-desktop
      signal-desktop
      angryipscanner
      btop
      scribus
      # moonlight-qt # package is broken, installed with flatpak
      pkgs-obsidian.obsidian #custom package to fix OpenGL issue
      custom-obsidian-desktop
      acpilight
      ranger
      lazygit
      lazydocker
      xorg.xeyes
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
}
