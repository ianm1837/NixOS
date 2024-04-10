{ pkgs, ... }:

{
  programs.swaylock = {
    enable = false;
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
}