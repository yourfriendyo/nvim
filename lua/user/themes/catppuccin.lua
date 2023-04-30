local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    vim.notify("catppuccin not found")
    return
end

require("catppuccin").setup({
    transparent_background = false,
    term_colors = true,
    integrations = {
        treesitter = true,
        lsp_trouble = false,
        lsp_saga = true,
        gitgutter = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = true,
        },
        neotree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
        },
        which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        dashboard = true,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = false,
        hop = true,
        notify = true,
        telekasten = true,
        symbols_outline = true,
    }
})
