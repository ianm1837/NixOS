local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.nixd.setup{}

require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

require("catppuccin").setup({
  flavour = "macchiato",
  term_colors = true,
  integrations = {
    nvimtree = true,
  }
})
       
vim.cmd.colorscheme "catppuccin"


local ctp_feline = require('catppuccin.groups.integrations.feline')

require("feline").setup({
    components = ctp_feline.get(),
})


require("bufferline").setup{
  options = {
    separator_style = "slant",
    offsets = {
      {filetype = "NvimTree", text = "File Explorer", text_align = "center"}
    },
  },
}
