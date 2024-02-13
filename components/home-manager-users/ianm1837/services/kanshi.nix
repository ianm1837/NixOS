{ pkgs, ... }:

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
          "pkill waybar"
          "${pkgs.swayfx}/bin/sway exec waybar"
          "${pkgs.waybar}/bin/waybar"
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
          "pkill waybar"
          "${pkgs.swayfx}/bin/sway exec waybar"
          "${pkgs.waybar}/bin/waybar"
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
          "pkill waybar"
          "${pkgs.swayfx}/bin/sway exec waybar"
          "${pkgs.waybar}/bin/waybar"
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
          "pkill waybar"
          "${pkgs.swayfx}/bin/sway exec waybar"
          "${pkgs.waybar}/bin/waybar"
        ];
      };
    };
  };
}
