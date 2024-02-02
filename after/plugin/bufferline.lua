local bufferline = require("bufferline")

bufferline.setup({
    options = {
        mode = "tabs",
        separator_style = 'slant',
        color_icons = true
    },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

