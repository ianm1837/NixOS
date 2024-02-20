{ pkgs, ... }:

{
#  programs.neovim = 
#  {
#    enable = true;
#    viAlias = true;
#    vimAlias = true;
#    vimdiffAlias = true;
#    withNodeJs = true;
#
#    plugins = with pkgs.vimPlugins; [
#      nvim-web-devicons
#      nvim-lspconfig
#      nvim-tree-lua
#      vim-tmux-navigator
#      commentary
#      catppuccin-nvim
#      feline-nvim
#      fzf-lua
#      bufferline-nvim
#    ];
#
#    extraLuaConfig = ''
#      packadd! require("config")
#      packadd! require("plugins")
#    '';
#  };
}
