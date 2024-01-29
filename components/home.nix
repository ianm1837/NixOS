{ config, pkgs, ... }:

{
  home.username = "ianm1837";
  home.homeDirectory = "/home/ianm1837";

  home.stateVersion = "23.11"; # no touch

  home.packages = [];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.tokyo-night-gtk;
      name = "Tokyonight-Dark-B";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

#   home.file.".xinitrc".text = ''
# exec Hyprland
#   '';

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
