{ homePath, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      top = "btop";
      snr = "sudo nixos-rebuild switch --flake ~/git/nixos";
      v = "nvf";
    };
    initExtra = ''
      function list_all() {
          emulate -L zsh
          ls -a
      }
      chpwd_functions=(''${chpwd_functions[@]} "list_all")

      nvf() {
        if [[ $# -eq 0 ]]; then
          nvim .
        else
          nvim "$@"
            fi
      }

      tmux attach
    '';
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
