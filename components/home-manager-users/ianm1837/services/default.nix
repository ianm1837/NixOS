{ user-attributes, pkgs, ... }:

{
  imports = [
    ./kanshi.nix
    ./dunst.nix
    #./swayidle.nix
    #./custom-resume.nix
    ./shutdown-scripts.nix
  ];
}
