local M = {}

local state = { buf = nil, win = nil }

local function get_note_path()
	local cwd = vim.fn.getcwd()
	local sanitized = cwd:gsub("/", "%%")
	local dir = vim.fn.stdpath("data") .. "/project-notes"
	vim.fn.mkdir(dir, "p")
	return dir .. "/" .. sanitized .. ".md"
end

local function make_win_opts()
	local width = math.floor(vim.o.columns * 0.6)
	local height = math.floor(vim.o.lines * 0.7)
	return {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
		title = " Project Notes ",
		title_pos = "center",
	}
end

local function save_note()
	if state.buf and vim.api.nvim_buf_is_valid(state.buf) and vim.bo[state.buf].modified then
		vim.api.nvim_buf_call(state.buf, function()
			vim.cmd("silent write")
		end)
	end
end

local function create_buf()
	local path = get_note_path()
	local buf = vim.api.nvim_create_buf(false, false)
	vim.api.nvim_buf_call(buf, function()
		vim.cmd("silent edit " .. vim.fn.fnameescape(path))
	end)
	-- re-fetch the buffer handle since :edit may have switched it
	buf = vim.fn.bufnr(path)
	vim.bo[buf].bufhidden = "hide"
	vim.bo[buf].filetype = "markdown"

	vim.api.nvim_create_autocmd({ "BufLeave", "BufHidden" }, {
		buffer = buf,
		callback = function()
			save_note()
		end,
	})

	state.buf = buf
	return buf
end

function M.toggle()
	-- If window is open and valid, save and close
	if state.win and vim.api.nvim_win_is_valid(state.win) then
		save_note()
		vim.api.nvim_win_close(state.win, true)
		state.win = nil
		return
	end

	-- Create buffer if needed
	if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
		create_buf()
	end

	-- Open floating window
	state.win = vim.api.nvim_open_win(state.buf, true, make_win_opts())

	-- Close on <Esc> in normal mode (buffer-local)
	vim.keymap.set("n", "<Esc>", M.toggle, { buffer = state.buf, desc = "Close project notes" })
end

function M.setup()
	vim.api.nvim_create_autocmd("VimResized", {
		callback = function()
			if state.win and vim.api.nvim_win_is_valid(state.win) then
				vim.api.nvim_win_set_config(state.win, make_win_opts())
			end
		end,
	})
	vim.keymap.set("n", "<leader>n", M.toggle, { desc = "Toggle project notes" })
end

return M
