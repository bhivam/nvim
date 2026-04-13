require("lualine").setup({
	theme = "catppuccin",
	options = {
		icons_enabled = false,
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "diff" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "diagnostics" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = { "branch" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "filetype" },
		lualine_z = {},
	},
})
