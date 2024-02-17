{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    newSession = true;
    sensibleOnTop = false;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
      }
      {
        plugin = tmuxPlugins.catppuccin;
      }
      {
        plugin = tmuxPlugins.resurrect;
      }
      {
        plugin = tmuxPlugins.continuum;
      }
      {
        plugin = tmuxPlugins.cpu;
      }

    ];
    extraConfig = ''
        set -g prefix C-a
        unbind C-b
        bind-key C-a send-prefix

        unbind %
        bind | split-window -h

        unbind '"'
        bind - split-window -v

        unbind r
        bind r source-file ~/.config/tmux/tmux.conf

        bind -r j resize-pane -D 1
        bind -r k resize-pane -U 1
        bind -r l resize-pane -R 1
        bind -r h resize-pane -L 1

        bind -r m resize-pane -Z


        
    '';
  };
}
