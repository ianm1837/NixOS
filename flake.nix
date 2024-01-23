{
  description = "Gold Standard";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
  };

  outputs = {self, nixpkgs, ... }:
  let
    lib = nixpkgs.lib;
    hostname = "nixos";
  in 
  {
    nixosConfigurations = {
      ${hostname} = lib.nixosSystem {
        specialArgs = {
          inherit hostname;
        };
        system = "x86_64-linux";
        modules = [ 
          ./components/hardware-configuration.nix
          ./components/hardware-options.nix
          ./components/system-settings.nix
          ./components/system-software.nix
          ./components/users.nix
          ./components/kde.nix
        ];
      };
    };
  };
}