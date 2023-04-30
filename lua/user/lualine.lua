local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    vim.notify("lualine is not found!")
    return
end

lualine.setup({
    options = {
        theme = 'catppuccin',
    },
    sections = {
        lualine_c = {
            'lsp_progress',
        },
    },
})



-- { left = '', right = ''},
-- { left = '', right = ''},

