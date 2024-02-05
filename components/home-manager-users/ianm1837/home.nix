{ config, pkgs, pkgs-obsidian, user-attributes, ... }:

# beginning of theme management; need to pass from user-attributes and add themes as needed
let 
  theme = "tokyo-night";
  homePath = "/home/ianm1837";
  colors = user-attributes.colors;
in
{ 
  imports = [
    ./themes/${theme}.nix
    ./services/default.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = import ./apps/hyprland/default.nix { inherit colors; };
  };

  services = {
    # kanshi = {
    #   enable = true;
    #   profiles = {
    #     laptop-only = {
    #       outputs = [
    #         {
    #           criteria = "eDP-1";
    #           status = "enable";
    #           scale = 1.6;
    #           mode = "2560x1600@165";
    #         }
    #       ];
    #     };
    #     one-monitor-a = {
    #       outputs = [
    #         {
    #           criteria = "eDP-1";
    #           status = "disable";
    #         }
    #         {
    #           criteria = "DP-1";
    #           status = "enable";
    #         }
    #       ];
    #     };
    #     one-monitor-b = {
    #       outputs = [
    #         {
    #           criteria = "eDP-1";
    #           status = "disable";
    #         }
    #         {
    #           criteria = "DP-2";
    #           status = "enable";
    #         }
    #       ];
    #     };
    #     both-monitors = {
    #       outputs = [
    #         {
    #           criteria = "eDP-1";
    #           status = "disable";
    #         }
    #         {
    #           criteria = "GIGA-BYTE TECHNOLOGY CO., LTD. Gigabyte M32Q 0x00000583";
    #           status = "enable";
    #           position = "0,0";
    #         }
    #         {
    #           criteria = "GIGA-BYTE TECHNOLOGY CO., LTD. Gigabyte M32Q 0x00000228";
    #           status = "enable";
    #           position = "2560,0";
    #         }
    #       ];
    #     };
    #   };
    # };
    dunst = {
      enable = true;
      settings = {
        global = {
          monitor = 0;
          follow = "mouse";
          width = 300;
          height = 300;
          origin = "top-center";
          offset = "10x50";
          scale = 0;
          notification_limit = 0;
          progress_bar = true;
          progress_bar_height = 10;
          progress_bar_frame_width = 1;
          progress_bar_min_width = 150;
          progress_bar_max_width = 300;
          indicate_hidden = "yes";
          transparency = 15;
          separator_height = 1;
          padding = 8;
          horizontal_padding = 10;
          text_icon_padding = 0;
          frame_width = 0;
          frame_color = "#282a36";
          separator_color = "frame";
          sort = "yes";
          idle_threshold = 120;
          font = "Monospace 10";
          line_height = 0;
          markup = "full";
          format = "%s %p\\n%b";
          alignment = "left";
          vertical_alignment = "center";
          show_age_threshold = 60;
          ellipsize = "middle";
          ignore_newline = "no";
          stack_duplicates = "true";
          hide_duplicate_count = "false";
          show_indicators = "yes";
          icon_position = "left";
          min_icon_size = 0;
          max_icon_size = 64;
          icon_path = "/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/";
          sticky_history = "yes";
          history_length = 20;
          dmenu = "/usr/bin/dmenu -p dunst:";
          browser = "brave --new-tab";
          always_run_script = "true";
          title = "Dunst";
          class = "Dunst";
          corner_radius = 15;
          ignore_dbusclose = "false";
          force_xwayland = "false";
          force_xinerama = "false";
          mouse_left_click = "close_current";
          mouse_middle_click = "do_action, close_current";
          mouse_right_click = "close_all";
        };
        experimental = {
          per_monitor_dpi = false;
        };
        urgency_low = {
          background = "#282a36";
          foreground = "#6272a4";
          timeout = 10;
        };
        urgency_normal = {
          background = "#282a36";
          foreground = "#bd93f9";
          timeout = 10;
        };
        urgency_critical = {
          background = "#ff5555";
          foreground = "#f8f8f2";
          frame_color = "#ff5555";
          timeout = 0;
        };
      };
    };
    swayidle = {
      enable = true;
      systemdTarget = "hyprland-session.target";
      timeouts = [
        {
          timeout = 300;
          command = "${pkgs.swaylock-effects}/bin/swaylock";
        }
        {
          timeout = 305;
          command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
          resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }
        {
          timeout = 900;
          command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on; ${pkgs.coreutils}/bin/sleep 1; ${pkgs.systemd}/bin/systemctl suspend";
          resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = "${pkgs.swaylock-effects}/bin/swaylock";
        }
      ];
    };
  };

  programs = {
    kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono NFM Regular"; #kitty list-fonts
        size = 16;
      };
      keybindings = {
        "ctrl+equal" = "change_font_size all +2.0";
        "ctrl+minus" = "change_font_size all -2.0";
        "ctrl+backspace" = "change_font_size all 0";
      };
      settings = {
        confirm_os_window_close = "0";
        background_opacity = "0.9";
        background_blur = "1";
      };
    };
    lf.enable = true;
    pywal.enable = true;
    swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        color = "000000";
        indicator = true;
        clock = true;
        image = "/home/ianm1837/Wallpapers/hiep-duong-uDvcxeACIV0-unsplash.jpg";
        effect-blur = "5x5";
        daemonize = true;
      };
    };
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
    packages = with pkgs; [
      vscode
      brave
      mattermost-desktop
      signal-desktop
      angryipscanner
      btop
      bun
      scribus
      moonlight-qt
      pkgs-obsidian.obsidian #custom package to fix OpenGL issue
      neovim

    ];
    file = {
      ".config/hypr/scripts" = {
        source = ./raw-dots/hypr/scripts;
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
      ".config/wlogout" = {
        source = ./raw-dots/wlogout;
        recursive = true;
      };
    };
  };
}
