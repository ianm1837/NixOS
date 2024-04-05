{
  description = "Gold Standard";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # hyprland.url = "github:hyprwm/Hyprland";

    # ondsel.url = "github:pinpox/ondsel-nix";

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
      username = "ianm1837";
      desktop-environment = "sway";
      colors = {};
      wallpaper = "~/wallpapers/jase-bloor-oCZHIa1D4EU-unsplash.jpg";
    };

    pkgs-options = input: {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-25.9.0"
        ];
      };
    };

    pkgs = import inputs.nixpkgs (pkgs-options inputs.nixpkgs);
    pkgs-obsidian = import inputs.obsidian-package (pkgs-options inputs.obsidian-package);

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
