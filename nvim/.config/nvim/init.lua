require("vim-options")
require("config.lazy") 

local config = require("nvim-treesitter.configs")

config.setup({
  ensure_installed = {"lua", "javascript", "rust"},
  highlight = { enable = true },
  indent = { enable = true},
})
