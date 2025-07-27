-- General
vim.keymap.set("n", "qq", "<cmd>qa<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "Y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "P", '"+p', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Format", noremap = true, silent = true })
