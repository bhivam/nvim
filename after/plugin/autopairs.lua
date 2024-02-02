local status, autopairs = pcall(requre, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
    disable_filetype = {"TelescopePrompt", "vim"},
})
