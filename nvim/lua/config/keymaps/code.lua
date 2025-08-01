vim.keymap.set("n", "sr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "si", "<cmd>Telescope lsp_incoming_calls<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "so", "<cmd>Telescope lsp_outgoing_calls<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "cr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc="Rename symbol" })
vim.keymap.set("n", "ch", function()
  vim.lsp.buf.clear_references()
	vim.lsp.buf.document_highlight()
end, { noremap = true, silent = true })
