vim.cmd [[
  autocmd VimResized * wincmd =
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  hi NvimTreeNormal guibg=NONE
  hi DashboardHeader guifg=#a30202
  hi DashboardFooter guifg=#e0af68
]]
vim.g.mapleader = " "

require("config.lazy") 

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')

local config = require("nvim-treesitter.configs")

config.setup({
  ensure_installed = {"lua", "javascript", "rust"},
  highlight = { enable = true },
  indent = { enable = true},
})
