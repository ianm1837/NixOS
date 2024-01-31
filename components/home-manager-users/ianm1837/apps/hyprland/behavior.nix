{
  animations = {
    enabled = yes;
    bezier = "myBezier, 0.05, 0.9, 0.1, 1";
    animation = "windows, 1, 3, myBezier, popin 80%";
    animation = "windowsOut, 1, 7, default, popin 80%";
    animation = "border, 1, 10, default";
    animation = "borderangle, 1, 8, default";
    animation = "fade, 1, 7, default";
    animation = "workspaces, 1, 6, default";
  };

  binds = {
    scroll_event_delay = ".3";
  };

  dwindle = {
    pseudotile = yes;
    preserve_split = yes;
  };

  master = {
    new_is_master = true;
  };

  gestures = {
    workspace_swipe = on;
  };

  misc = {
    force_default_wallpaper = 0;
    disable_splash_rendering = 1;
    disable_autoreload = 1;
  };

  env = [
    "XCURSOR_SIZE,24"
  ];

  input = {
      kb_layout = us;
      follow_mouse = 1;
      numlock_by_default = true;

      touchpad = {
          natural_scroll = yes;
          scroll_factor = 0.25;
          clickfinger_behavior = true;
      };

      sensitivity = 0;
      accel_profile = flat;
  };

  # input:touchpad{
  #     scroll_factor = 0.8
  # }
}