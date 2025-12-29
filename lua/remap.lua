vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent update")
		end
	end,
})

vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", {
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>pf", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })
