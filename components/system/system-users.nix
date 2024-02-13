{ config, pkgs, pkgs-obsidian, inputs, home-manager, user-attributes, ... }:

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

  home-manager = {
    extraSpecialArgs = { inherit inputs user-attributes; };

    users = {
      "ianm1837" = import ../home-manager-users/ianm1837/home.nix { inherit config pkgs pkgs-obsidian inputs home-manager user-attributes; };
    };
  };
}
