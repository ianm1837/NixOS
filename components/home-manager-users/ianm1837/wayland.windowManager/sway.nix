{ inputs, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = false;
    package = pkgs.swayfx;
    xwayland = true;
  };
}
