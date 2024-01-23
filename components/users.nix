{ config, pkgs, ... }:

{
  users.users.ianm1837 = {
    isNormalUser = true;
    description = "ianm1837";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}