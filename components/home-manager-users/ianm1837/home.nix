{ config, pkgs, ... }:


let
  theme = "tokyo-night";
  homePath = "/home/ianm1837";
in
{ 
  imports = [
    ../themes/${theme}.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      imports = ./apps
    }
  };

  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        top = "btop";
        snr = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      };
      initExtra = ''
        function list_all() {
            emulate -L zsh
            ls -a
        }
        chpwd_functions=(''${chpwd_functions[@]} "list_all")
      '';
      profileExtra = ''
        # if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        #   exec Hyprland
        # fi
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

  home = {
    stateVersion = "23.11"; # no touch
    username = "ianm1837";
    homeDirectory = "${homePath}";
    packages = [];
    file = {
      ".config/hypr" = {
        source = ./raw-dots/hypr;
        recursive = true;
      };
      ".config/dunst" = {
        source = ./raw-dots/dunst;
        recursive = true;
      };
      ".config/kanshi" = {
        source = ./raw-dots/kanshi;
        recursive = true;
      };
      ".config/kitty" = {
        source = ./raw-dots/kitty;
        recursive = true;
      };
      ".config/rofi" = {
        source = ./raw-dots/rofi;
        recursive = true;
      };
      ".config/waybar" = {
        source = ./raw-dots/waybar;
        recursive = true;
      };
    };
  };
}
