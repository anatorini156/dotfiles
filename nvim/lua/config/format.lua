require("conform").setup({
	lua = { "stylua" },
	nix = { "nixfmt" },
	python = { "black" },
	c = { "clang-format" },
	cpp = { "clang-format" },
	json = { "clang-format" },
	zig = { "zigfmt" },
})
