return {
	{
		"numToStr/Comment.nvim",

		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				toggler = {
					line = "<leader>/",
					block = "gc",
				},
			})
		end,
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",

		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
}
