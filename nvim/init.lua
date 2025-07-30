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
vim.opt.undofile = true
vim.g.disable_autoformat = true
vim.wo.cursorline = true

require("config.lazy")
require("config.keymaps.index")
require("config.lsp")
require("config.format")
require("config.commands")

require("nvim-tree").setup()
require("telescope")


vim.o.foldmethod = "expr"
vim.o.foldexpr   = "v:lua.vim.lsp.foldexpr()"
vim.o.foldtext   = "v:lua.vim.lsp.foldtext()"
vim.o.foldcolumn = "1"
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.supports_method("textDocument/foldingRange") then
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr   = "v:lua.vim.lsp.foldexpr()"
      vim.wo.foldtext   = "v:lua.vim.lsp.foldtext()"
    end
  end,
})
