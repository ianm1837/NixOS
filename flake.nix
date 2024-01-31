{
  description = "Gold Standard";

  inputs = {
    # I like to live dangerously ¯\_(ツ)_/¯
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
    obsidian-package.url = "github:yshui/nixpkgs/obsidion-libgl";
  };

  # include all inputs to output function in one attribute set called inputs to be concise
  outputs = { ... }@inputs:
  let
    system = "x86_64-linux";

    user-attributes = {
      desktop-environment = "hyprland";

    };

    pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-25.9.0"
        ];
      };
    };

    pkgs-obsidian = import inputs.obsidian-package {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-25.9.0"
        ];
      };
    };

    specialArgs = {
      inherit 
        inputs 
        system 
        pkgs 
        pkgs-obsidian
        user-attributes
      ;

    };
  in 
  {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [ 
          inputs.home-manager.nixosModules.default
          inputs.auto-cpufreq.nixosModules.default
          ./components/hardware
          ./components/system
          ./components/system/desktop-environments/${user-attributes.desktop-environment}.nix
        ];
      };
    };
  };
}