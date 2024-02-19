{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    newSession = true;
    sensibleOnTop = false;
    plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        cpu
        {
          plugin = catppuccin;
          extraConfig = '' 
            set -g @catppuccin_flavour 'frappe'
            set -g @catppuccin_window_tabs_enabled on
            set -g @catppuccin_date_time "%H:%M"
            '';
        }
        {
          plugin = resurrect;
          extraConfig = ''
            set -g @resurrect-strategy-vim 'session'
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
        '';
        }
        {
          plugin = continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-boot 'on'
            set -g @continuum-save-interval '10'
          '';
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

        set-option -g default-command "$SHELL"
    '';
  };
}
