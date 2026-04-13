-- Completion
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
})

-- LSP
vim.opt.signcolumn = "yes"

local lsp_defaults = require("lspconfig").util.default_config
lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf, silent = true }

		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
})

-- Configure servers directly (installed via Nix, no mason needed)
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.gopls.setup({})
lspconfig.eslint.setup({
	settings = {
		experimental = {
			useFlatConfig = true,
		},
	},
})
