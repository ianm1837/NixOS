{ pkgs, ... }:

{
  programs.neovim = 
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = ''
          require("nvim-tree").setup({
            actions = {
              open_file = {
                quit_on_open = true,
              },
            },
          })
        
        '';
      }
      {
        plugin = vim-tmux-navigator;
      }
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
          require("catppuccin").setup({
            flavour = "macchiato",
            term_colors = true,
            integrations = {
              nvimtree = true,
            }
          })
                 
          vim.cmd.colorscheme "catppuccin"
        '';
      }
      {
        plugin = feline-nvim;
        type = "lua";
        config = ''
          local ctp_feline = require('catppuccin.groups.integrations.feline')

          require("feline").setup({
              components = ctp_feline.get(),
          })
        '';
      }
      {
        plugin = fzf-lua;
      }

    ];

    extraLuaConfig = ''
      -- theme



      -- Basic settings
      vim.o.relativenumber = true        -- Show line numbers
      vim.o.syntax = "on"        -- Enable syntax highlighting
      vim.wo.wrap = false        -- Disable text wrapping
      vim.opt.tabstop = 2      -- Number of spaces that a <Tab> in the file counts for.
      vim.opt.shiftwidth = 2   -- Number of spaces to use for each step of (auto)indent.
      vim.opt.expandtab = true -- Use spaces instead of tabs.

      -- Key mappings
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "
      vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Tab>', '>>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>f', ":FzfLua files<CR>", {silent = true})

    '';
  };
}
