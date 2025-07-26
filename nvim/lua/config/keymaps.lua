-- General
vim.keymap.set('n', 'qq', '<cmd>qa<CR>', { noremap = true, silent = true })

-- Navigate windows

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

-- Navigate buffers

vim.keymap.set('n', '<S-h>', '<cmd>bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-l>', '<cmd>bn<CR>', { noremap = true, silent = true })


-- Manage buffers
vim.keymap.set('n', '<leader>bd', '<cmd>bp|bd #<CR>', { noremap = true, silent = true })


-- Manage windows
vim.keymap.set("n", "<leader>wd", "<cmd>close<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<leader>cf",
	function()
		vim.lsp.buf.format()
	end
	, { desc = "Format", noremap = true, silent = true })
