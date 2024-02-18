vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
    callback = function()
        if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
            vim.api.nvim_command('silent update')
        end
    end,
})

function Save_file()
    local modifiable = vim.api.nvim_buf_get_option(0, 'modifiable')
    if modifiable then
        vim.cmd 'w!'
    end
end

vim.keymap.set('n', '<leader>w', '<Cmd>lua Save_file()<CR>', {
    noremap = true,
    silent = true,
})

-- LSP MAPPINGS
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>fm', '<Cmd>lua vim.lsp.buf.format()<CR>')

-- TAB MAPPINGS
vim.keymap.set('n', '<leader>tN', '<Cmd>tabnew<CR>')
vim.keymap.set('n', '<leader>tn', '<Cmd>tabnext<CR>')

