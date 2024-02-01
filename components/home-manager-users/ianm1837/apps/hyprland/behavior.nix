{
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
}