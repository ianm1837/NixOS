{ config, pkgs, inputs, home-manager, ... }:

{
  imports = [ inputs.home-manager.nixosModules.default ];
  programs = {
    zsh = {
      enable = true;
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "sudo"
          "systemadmin"
          "docker"
          "docker-compose"
          "bun"
          "dotenv"
          "git"
	        "vscode"
        ];
      };
    };
  };
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
      "ianm1837" = import ./home.nix;
    };
  };
}
