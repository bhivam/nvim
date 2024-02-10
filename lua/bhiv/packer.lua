local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		"catppuccin/nvim",
		as = "catppuccin" ,
		config = function()
			vim.cmd.colorscheme "catppuccin"
		end
	}


	use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}

	use {'nvim-treesitter/playground'}

	use {'theprimeagen/harpoon'}

	use {'mbbill/undotree'}

	use {'tpope/vim-fugitive'}

    use {'nvim-lualine/lualine.nvim'}

    use {'onsails/lspkind-nvim'} 

    use {'L3MON4D3/LuaSnip'}

    use {'hrsh7th/cmp-nvim-lsp'}

    use {'hrsh7th/cmp-buffer'}

    use {'hrsh7th/nvim-cmp'}

    use {'windwp/nvim-ts-autotag'}

    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

    use {'akinsho/nvim-bufferline.lua', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    use {'jose-elias-alvarez/null-ls.nvim'}

    use {'MunifTanjim/prettier.nvim'}

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    use {"stevearc/dressing.nvim"}

    use {"akinsho/flutter-tools.nvim"}

end)
