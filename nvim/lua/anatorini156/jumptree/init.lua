local JumpTree = {
	isVisible = false,
	history = {}, -- {text=..., location={uri=..., range=...}}
	window = nil,
	buffer = nil,
	origin_win = nil, -- the window we came from
}

-- Utility: get current cursor location
local function get_current_location()
	local pos = vim.api.nvim_win_get_cursor(0)
	local buf = vim.api.nvim_get_current_buf()
	local uri = vim.uri_from_bufnr(buf)
	return {
		uri = uri,
		range = {
			start = { line = pos[1] - 1, character = pos[2] },
			["end"] = { line = pos[1] - 1, character = pos[2] },
		},
	}
end

function JumpTree.goToDefinition()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()
	if node then
		local symbol = vim.treesitter.get_node_text(node, 0)
		JumpTree.add_symbol(symbol, get_current_location())
	end
	vim.lsp.buf.definition()
end

function JumpTree.setup()
	vim.keymap.set("n", "<leader>t", function()
		if JumpTree.isVisible then
			JumpTree.close()
		else
			JumpTree.open()
		end
	end, { desc = "Open the Jump Tree", silent = true })
	vim.keymap.set("n", "gd", function()
		JumpTree.goToDefinition()
	end, { noremap = true, silent = true })
end

function JumpTree.add_symbol(symbol, location)
	table.insert(JumpTree.history, { text = symbol, location = location })
	JumpTree.refresh()
end

function JumpTree.open()
	-- remember where we came from
	JumpTree.origin_win = vim.api.nvim_get_current_win()

	JumpTree.isVisible = true
	local buf = vim.api.nvim_create_buf(false, true)

	JumpTree.window = vim.api.nvim_open_win(buf, true, {
		width = 30,
		split = "left",
		win = 0,
	})

	-- Fill buffer
	local lines = {}
	for _, item in ipairs(JumpTree.history) do
		table.insert(lines, item.text)
	end
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	-- Buffer settings
	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].modifiable = false
	vim.bo[buf].readonly = true
	vim.bo[buf].bufhidden = "wipe"

	-- Keymaps inside JumpTree window
	vim.keymap.set("n", "<CR>", function()
		local row = vim.fn.line(".")
		local item = JumpTree.history[row]
		if item and item.location then
			local bufnr = vim.uri_to_bufnr(item.location.uri)
			vim.fn.bufload(bufnr)

			-- switch to the origin window (if still valid)
			if JumpTree.origin_win and vim.api.nvim_win_is_valid(JumpTree.origin_win) then
				vim.api.nvim_set_current_win(JumpTree.origin_win)
			end

			-- show buffer + move cursor
			vim.api.nvim_set_current_buf(bufnr)
			local target = item.location.range.start
			vim.api.nvim_win_set_cursor(0, { target.line + 1, target.character })
		end
	end, { buffer = buf, nowait = true, noremap = true, silent = true })

	vim.keymap.set("n", "q", function()
		JumpTree.close()
	end, { buffer = buf, nowait = true, noremap = true, silent = true })

	JumpTree.buffer = buf
end

function JumpTree.close()
	if JumpTree.window then
		JumpTree.isVisible = false
		vim.api.nvim_win_close(JumpTree.window, false)
		JumpTree.window = nil
		JumpTree.buffer = nil
		-- don’t clear origin_win so it can still be used for jumps
	end
end

function JumpTree.refresh()
	if JumpTree.buffer then
		vim.bo[JumpTree.buffer].modifiable = true
		vim.bo[JumpTree.buffer].readonly = false

		local lines = {}
		for _, item in ipairs(JumpTree.history) do
			table.insert(lines, item.text)
		end
		vim.api.nvim_buf_set_lines(JumpTree.buffer, 0, -1, false, lines)

		vim.bo[JumpTree.buffer].modifiable = false
		vim.bo[JumpTree.buffer].readonly = true
	end
end

return JumpTree
