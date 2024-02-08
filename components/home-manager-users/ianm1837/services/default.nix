{ user-attributes, ... }:

{
  imports = [
    ./kanshi.nix
    ./dunst.nix
    ./swayidle.nix
    #./custom-resume.nix
  ];
}