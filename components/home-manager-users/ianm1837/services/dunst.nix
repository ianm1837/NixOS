{ ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "10x10";
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
        frame_width = 3;
        frame_color = "#9aa5ce";
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        font = "Monospace 10";
        line_height = 0;
        markup = "full";
        format = "<span font_weight=\"ultrabold\">%s</span>\\n %p\\n%b";
        # format = "%a\\n%p\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = "true";
        hide_duplicate_count = "false";
        show_indicators = "false";
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
}