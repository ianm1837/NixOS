{ homePath, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      top = "btop";
      snr = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    };
    initExtra = ''
      function list_all() {
          emulate -L zsh
          ls -a
      }
      chpwd_functions=(''${chpwd_functions[@]} "list_all")
    '';
    # envExtra = ''
    #   export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share/:/usr/share/"
    #   export XDG_DATA_DIR="$XDG_DATA_HOME:/usr/local/share/:/usr/share/"
    #   export GSETTINGS_SCHEMA_DIR="/usr/share/glib-2.0/schemas"
    # '';
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
}