{ config, pkgs, pkgs-obsidian, inputs, home-manager, user-attributes, ... }:

{
  imports = [ inputs.home-manager.nixosModules.default ];

  users.users.ianm1837 = {
    isNormalUser = true;
    description = "ianm1837";
    extraGroups = [ "networkmanager" "wheel" "docker" "video" "adbusers" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs user-attributes; };

    users = {
      "ianm1837" = import ../home-manager-users/ianm1837/home-manager-config.nix { inherit config pkgs pkgs-obsidian inputs home-manager user-attributes; };
    };
  };
}
