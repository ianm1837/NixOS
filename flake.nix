{
  description = "Gold Standard";

  inputs = {
    nixpkgs.url = "nixpkgs/master";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, auto-cpufreq, ... }@attrs:
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
        specialArgs = attrs;
        modules = [ 
          auto-cpufreq.nixosModules.default
          ./hardware-configuration.nix
          ./system-configuration.nix
        ];
    };
  };
}
