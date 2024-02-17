{ pkgs, ... }:

{
  programs.neovim = 
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

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
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
          require("catppuccin").setup({
            transparent_background = true,
          })
        '';
      }
      {
        plugin = fzf-lua;
      }
      {
        plugin = toggleterm-nvim;
        type = "lua";
        config = ''
          require("toggleterm").setup({
            size = 20,
            open_mapping = [[c-j]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
              border = "curved",
              winblend = 0,
              highlights = {
                border = "Normal",
                background = "Normal",
                },
              },
          })
        '';
      }
    ];

    extraLuaConfig = ''
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
