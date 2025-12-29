return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		vim.g.guard_config = {
			fmt_on_save = true,
		}

		local ft = require("guard.filetype")
		ft("typescript,javascript,typescriptreact"):fmt("prettierd")

		ft("lua"):fmt("stylua")

		ft("rust"):fmt("rustfmt")

		ft("go"):fmt("gofmt")
	end,
}
