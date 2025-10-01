return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")
		ft("typescript,javascript,typescriptreact"):fmt("prettierd")

		--:fmt("prettier")--

		ft("lua"):fmt("stylua")

		ft("rust"):fmt("rustfmt")

		vim.g.guard_config = {
			fmt_on_save = true,
		}
	end,
}
