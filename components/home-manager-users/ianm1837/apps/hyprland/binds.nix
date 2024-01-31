{
  "$mainMod" = "SUPER";

  bind = [
    # Programs
    "$mainMod, T, exec, kitty"
    "$mainMod, B, exec, brave --enable-features=TouchpadOverscrollHistoryNavigation"
    "$mainMod, C, exec, code # --enable-features=UseOzonePlatform --ozone-platform=wayland"
    "$mainMod, Q, killactive, "
    "$mainMod, F4, exec, wlogout "
    "$mainMod, F, exec, dolphin"
    "$mainMod, V, togglefloating, "
    "$mainMod, Space, exec, rofi -show drun"
    "$mainMod, P, pseudo, # dwindle"
    "$mainMod, J, togglesplit, # dwindle"
    "$mainMod SHIFT, W, exec, /home/ianm1837/.config/hypr/scripts/restart-waybar.sh"
    "$mainMod, F1, exec, hyprctl reload && kanshictl reload"
    "$mainMod, F2, exec, kanshictl reload"

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
}