vim.keymap.set("n", "sr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "si", "<cmd>Telescope lsp_incoming_calls<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "so", "<cmd>Telescope lsp_outgoing_calls<CR>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"cr",
	"<cmd>lua vim.lsp.buf.rename()<CR>",
	{ noremap = true, silent = true, desc = "Rename symbol" }
)
vim.keymap.set("n", "ch", function()
	vim.lsp.buf.clear_references()
	vim.lsp.buf.document_highlight()
end, { noremap = true, silent = true, desc = "Highlight word under cursor" })

vim.keymap.set("n", "cH", function()
	vim.cmd.nohlsearch()
	pcall(vim.lsp.buf.clear_references, nil)
end, { desc = "Clear search highlights" })

local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

vim.keymap.set("n", "<leader>wr", function()
	local word = vim.fn.expand("<cword>")
	vim.api.nvim_feedkeys(
		":%s/\\V" .. word .. "//gI" .. vim.api.nvim_replace_termcodes("<Left><Left><Left>", true, false, true),
		"n",
		false
	)
end, { desc = "Replace word under cursor" })

vim.keymap.set("n", "<leader>wR", function()
	local WORD = vim.fn.expand("<cWORD>")
	vim.api.nvim_feedkeys(
		":%s/\\V" .. WORD .. "//gI" .. vim.api.nvim_replace_termcodes("<Left><Left><Left>", true, false, true),
		"n",
		false
	)
end, { desc = "Replace WORD under cursor" })

vim.keymap.set("n", "<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, {desc="Toggle inlay hints"})
