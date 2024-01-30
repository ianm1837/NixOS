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

    specialArgs = {
      inherit inputs;
      inherit system;
    };
  in 
  {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [ 
          inputs.home-manager.nixosModules.default
          inputs.auto-cpufreq.nixosModules.default
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