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
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          local lspconfig = require('lspconfig')
          lspconfig.pyright.setup {}
          lspconfig.tsserver.setup {}
          lspconfig.nixd.setup{}
        '';
      }
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
        plugin = commentary;
        type = "lua";
        config = ''
          
        '';
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
      -- filetype plugin indent on
      vim.cmd('filetype plugin indent on')
      vim.cmd([[
          autocmd FileType apache setlocal commentstring=#\ %s
      ]])

      --lspconfig settings 

      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>l', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>lf', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

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
