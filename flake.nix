{
  description = "Gold Standard";

  inputs = {
    nixpkgs.url = "nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    hostname = "nixos";
  in 
  {
    nixosConfigurations = {
      ${hostname} = lib.nixosSystem {
        specialArgs = {
          inherit hostname;
          inherit inputs;
        };
        system = "x86_64-linux";
        modules = [ 
          inputs.home-manager.nixosModules.default
          ./components/hardware-configuration.nix
          ./components/hardware-options.nix
          ./components/system-settings.nix
          ./components/system-software.nix
          ./components/users.nix
          # ./components/kde.nix
          ./components/hyprland.nix
        ];
      };
    };
  };
}