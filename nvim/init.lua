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
vim.opt.wrap = false
vim.opt.scrolloff = 15

vim.g.disable_autoformat = true

require("config.lazy")
require("config.keymaps.index")
require("config.lsp")
require("config.format")
require("config.commands")

require("nvim-tree").setup()
require("telescope")
