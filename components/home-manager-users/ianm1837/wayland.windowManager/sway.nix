{ inputs, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    xwayland = true;

  };
}
