{ inputs, pkgs, lib, ... }:

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
  wayland.windowManager.hyprland = {
    enable = true;
    # package = hyprland-flake.packages.${pkgs.system}.hyprland;
    systemd.enable = true;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 15;
        border_size = 2;
        "col.active_border" = "rgba(7aa2f7aa)";
        "col.inactive_border" = "rgba(414868aa)";
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {
        rounding = 10;
        blur = {
            enabled = false;
            size = 3;
            passes = 1;
        };
        drop_shadow = "no";
        shadow_range = 8;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      xwayland = {
        force_zero_scaling = true;
      };

      animations = {
        enabled = "no";
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1"
        ];
        animation = [
          "windows, 1, 3, myBezier, popin 80%"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      binds = {
        scroll_event_delay = "0.3";
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_is_master = "true";
      };

      gestures = {
        workspace_swipe = "on";
      };

      misc = {
        force_default_wallpaper = "0";
        disable_splash_rendering = "1";
        disable_autoreload = "1";
        vfr = "true";
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      env = [
        "XCURSOR_SIZE,24"
      ];

      input = {
          kb_layout = "us";
          follow_mouse = "1";
          numlock_by_default = "true";

          touchpad = {
              natural_scroll = "yes";
              scroll_factor = "0.25";
              clickfinger_behavior = "true";
          };

          sensitivity = "0";
          accel_profile = "flat";
      };

      "$mainMod" = "SUPER";

      bind = [
        # Programs
        "$mainMod, T, exec, kitty"
        "$mainMod, B, exec, brave --enable-features=TouchpadOverscrollHistoryNavigation"
        "$mainMod, C, exec, code-insiders --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod, Q, killactive, "
        "$mainMod, F4, exec, wlogout "
        "$mainMod, F, exec, dolphin"
        "$mainMod, V, togglefloating, "
        "$mainMod, Space, exec, rofi -show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod SHIFT, W, exec, /home/ianm1837/.config/scripts/restart-waybar.sh"
        "$mainMod, F1, exec, hyprctl reload && kanshictl reload"
        "$mainMod, F2, exec, kanshictl reload"
        # "$mainMod, L, exec, swaylock"

        # Move focus
        "SUPER,Tab,cyclenext,"
        "SUPER,Tab,bringactivetotop,"

        # Workspace management
        "$mainMod SHIFT, h, movetoworkspace, r-1"
        "$mainMod SHIFT, l, movetoworkspace, r+1"
        "$mainMod, h, workspace, r-1"
        "$mainMod, l, workspace, r+1"
        "$mainMod CONTROL, h, movecurrentworkspacetomonitor, -1"
        "$mainMod CONTROL, l, movecurrentworkspacetomonitor, +1"
        "$mainMod, f, fullscreen"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # for screenshots
        "$mainMod SHIFT, S, exec, grimblast copy area"
        "$mainMod CONTROL, S, exec, grimblast copy screen"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      exec-once = [
        "tee /sys/class/leds/tpacpi::kbd_backlight/brightness <<< 1"
        "kanshi & waybar & waypaper --restore & nm-applet --indicator & blueman-applet & hyprctl setcursor Bibata-Modern-Classic 24 &"
        "~/.config/scripts/watch-socket.sh &" # restart kanshi when hyprland is reset
        "~/.config/scripts/startup-delay.sh"
        "swaylock"
      ];
    };
  };
}
