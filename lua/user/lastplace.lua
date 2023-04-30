local status_ok, lastposition = pcall(require, "nvim-lastplace")
if not status_ok then
    vim.notify("nvim-lastposition not found!")
    return
end

require('nvim-lastplace').setup({
    lastplace_ignore_buftype = {
        "quickfix",
        "nofile",
        "help",
    },
    lastplace_ignore_filetype = {
        "NvimTree",
        "gitcommit",
        "gitrebase",
        "svn",
        "hgcommit"
    },
    lastplace_open_folds = true,
})
