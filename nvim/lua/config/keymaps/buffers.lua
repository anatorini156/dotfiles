-- Navigate buffers

vim.keymap.set("n", "<S-h>", "<cmd>bp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>bn<CR>", { noremap = true, silent = true })

-- Manage buffers
vim.keymap.set("n", "<leader>bd", "<cmd>bp|bd #<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true })
