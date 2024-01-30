{
  description = "Gold Standard";

  inputs = {
    nixpkgs.url = "nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # specific obsidian repo for wayland compatibility. will be merged soon, need to check master asap.
    obsidian-package ={
      url = "github:yshui/nixpkgs/obsidion-libgl";
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, auto-cpufreq, obsidian-package, ... }:
  let
    system = "x86_64-linux";

    specialArgs = {
      inherit inputs;
      inherit system;

      pkgs-obsidian = import obsidian-package {
        inherit system;
        config.allowUnfree = true;
        config.permittedInsecurePackages = [
          "electron-25.9.0"
        ];
      };
    };
  in 
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [ 
          inputs.home-manager.nixosModules.default
          auto-cpufreq.nixosModules.default
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