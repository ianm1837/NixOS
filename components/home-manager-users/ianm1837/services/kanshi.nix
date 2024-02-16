{ pkgs, user-attributes, ... }:

{
  services.kanshi = {
    enable = true;
    profiles = {
      laptop-only = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            scale = 1.6;
            mode = "2560x1600@165";
          }
        ];
        exec = [
          "${pkgs.swayfx}/bin/sway exec ~/.config/sway/scripts/restart-waybar.sh"
          "${pkgs.swww}/bin/swww img ${user-attributes.wallpaper}"
        ];
      };
      one-monitor-a = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "DP-1";
            status = "enable";
          }
        ];
        exec = [
          "${pkgs.swayfx}/bin/sway exec ~/.config/sway/scripts/restart-waybar.sh"
          "${pkgs.swww}/bin/swww img ${user-attributes.wallpaper}"
        ];
      };
      one-monitor-b = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "DP-2";
            status = "enable";
          }
        ];
        exec = [
          "${pkgs.swayfx}/bin/sway exec ~/.config/sway/scripts/restart-waybar.sh"
          "${pkgs.swww}/bin/swww img ${user-attributes.wallpaper}"
        ];
      };
      both-monitors = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "GIGA-BYTE TECHNOLOGY CO., LTD. Gigabyte M32Q 0x00000583";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "GIGA-BYTE TECHNOLOGY CO., LTD. Gigabyte M32Q 0x00000228";
            status = "enable";
            position = "2560,0";
          }
        ];
        exec = [
          "${pkgs.swayfx}/bin/sway exec ~/.config/sway/scripts/restart-waybar.sh"
          "${pkgs.swww}/bin/swww img ${user-attributes.wallpaper}"
        ];
      };
    };
  };
}
