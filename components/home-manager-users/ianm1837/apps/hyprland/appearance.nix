{
  general = {
    gaps_in = 5;
    gaps_out = 15;
    border_size = 2;
    col.active_border = rgba(7aa2f7aa);
    col.inactive_border = rgba(414868aa);
    layout = dwindle;
    allow_tearing = false;
  };

  decoration = {
    rounding = 10;
    blur = {
        enabled = true;
        size = 3 ;
        passes = 1;
    }
    drop_shadow = yes;
    shadow_range = 8;
    shadow_render_power = 3;
    col.shadow = rgba(1a1a1aee);
  };

  xwayland = {
    force_zero_scaling = true;
  };
}