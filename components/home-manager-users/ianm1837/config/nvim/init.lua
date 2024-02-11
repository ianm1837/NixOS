local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('folke/tokyonight.nvim')

vim.call('plug#end')

vim.cmd[[colorscheme tokyonight]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.o.relativenumber = true        -- Show line numbers
vim.o.syntax = "on"        -- Enable syntax highlighting
vim.wo.wrap = false        -- Disable text wrapping
vim.opt.tabstop = 2      -- Number of spaces that a <Tab> in the file counts for.
vim.opt.shiftwidth = 2   -- Number of spaces to use for each step of (auto)indent.
vim.opt.expandtab = true -- Use spaces instead of tabs.

-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', '>>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {noremap = true, silent = true})

-- Plugin configuration for nvim-tree.lua
require'nvim-tree'.setup {
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

