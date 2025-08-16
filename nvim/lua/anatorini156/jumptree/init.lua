local JumpTree = {
	isVisible = false,
	history = {},
	window = nil,
	buffer = nil,
}

function JumpTree.goToDefinition()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()
  local p1,p2
  local t1,t2

  if node then
    p1 = node.parent(node)
  end

  if p1 then
    p2 = p1.parent(p1)
    t1 = vim.treesitter.get_node_text(p1,0)
  end

  if p2 then
    t2 = vim.treesitter.get_node_text(p2,0)
  end
	if node then
		print(
      vim.treesitter.get_node_text(node, 0),
      t1,
      t2
    )
		JumpTree.add_symbol(vim.treesitter.get_node_text(node, 0))
	end
	vim.lsp.buf.declaration()
end

function JumpTree.setup()
	vim.keymap.set("n", "<leader>t", function()
		if JumpTree.isVisible then
			JumpTree.close()
		else
			JumpTree.open()
		end
	end, { desc = "Open the Jump Tree ", silent = true })
	vim.keymap.set("n", "gd", function()
		JumpTree.goToDefinition()
	end, { noremap = true, silent = true })
end

function JumpTree.add_symbol(symbol)
	table.insert(JumpTree.history, symbol)
	JumpTree.refresh()
end

function JumpTree.open()
	JumpTree.isVisible = true
	local buf = vim.api.nvim_create_buf(false, true) -- no file, scratch

	JumpTree.window = vim.api.nvim_open_win(buf, true, {
		width = 30,
		split = "left",
		win = 0,
	})

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, JumpTree.history)
	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].modifiable = false
	vim.bo[buf].readonly = true
	JumpTree.buffer = buf
end

function JumpTree.close()
	if JumpTree.window then
		JumpTree.isVisible = false
		vim.api.nvim_win_close(JumpTree.window, false)
	end
end

function JumpTree.refresh()
	if JumpTree.buffer then
		vim.bo[JumpTree.buffer].modifiable = true
		vim.bo[JumpTree.buffer].readonly = false
		print("Inspecting...")
		print(vim.json.encode(JumpTree.history))

		vim.api.nvim_buf_set_lines(JumpTree.buffer, 0, -1, false, JumpTree.history)

		vim.bo[JumpTree.buffer].modifiable = false
		vim.bo[JumpTree.buffer].readonly = true
	end
end

return JumpTree
