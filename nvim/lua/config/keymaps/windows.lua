-- Navigate windows

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

-- Manage windows
vim.keymap.set("n", "<leader>wd", "<cmd>close<CR>", {desc = "Close window", noremap = true, silent = true })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR><C-w>l<CR>", {desc = "Split window vertically", noremap = true, silent = true })
vim.keymap.set("n", "<leader>wh", "<cmd>split<CR><C-w>j<CR>", { desc = "Split window horizontally",noremap = true, silent = true })
