vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.number = true
vim.o.relativenumber = false
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.undofile = true
vim.g.disable_autoformat = false
vim.wo.cursorline = true

require("config.lazy")
require("config.keymaps.index")
require("config.lsp")
require("config.format")
require("config.commands")

require("nvim-tree").setup({
	view = {
		side = "right",
	},
})
require("telescope")
