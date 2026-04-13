vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("set")
require("remap")
require("plugins")
require("project-notes").setup()

vim.cmd.colorscheme("catppuccin")
