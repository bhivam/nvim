require("nvim-treesitter.configs").setup({
	-- Parsers are installed via Nix, not by treesitter
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "python", "c" },
	},
})
