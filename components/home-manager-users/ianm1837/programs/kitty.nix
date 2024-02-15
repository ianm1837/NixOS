{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono NFM Regular"; #kitty list-fonts
      size = 14;
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
}