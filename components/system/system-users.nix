{ config, pkgs, inputs, home-manager, ... }:

{
  imports = [ inputs.home-manager.nixosModules.default ];

  programs.zsh.enable = true;
  
  users.users.ianm1837 = {
    isNormalUser = true;
    description = "ianm1837";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
  services.getty.autologinUser = "ianm1837";

  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    users = {
      "ianm1837" = import ../home-manager-users/ianm1837.nix;
    };
  };
}