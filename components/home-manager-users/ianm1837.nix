{ config, pkgs, ... }:


let
  theme = "tokyo-night";
  homePath = "/home/ianm1837";
in
{ 
  imports = [
    ../themes/${theme}.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;



  programs = {
    zsh = {
      enable = true;

      oh-my-zsh = {
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

  home = {
    stateVersion = "23.11"; # no touch
    username = "ianm1837";
    homeDirectory = "${homePath}";
    packages = [];
    file = {
      "./zshrc".source = ../raw-dots/.zshrc;
      "./zprofile".source = ../raw-dots/.zprofile;
    };
  };
}
