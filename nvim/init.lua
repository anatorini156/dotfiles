vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.number = true
vim.o.relativenumber = false
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.opt.clipboard:append("unnamedplus")

require("config.lazy")
require("config.keymaps")
require("config.lsp")

require("nvim-tree").setup()
require('telescope')
