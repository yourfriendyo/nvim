local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
	vim.notify("Plugin nvim-treesitter is not existed", "error", "Plugin")
	return
end

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",    "cpp",   "go",         "rust", "lua",
        "vim",  "bash",  "javascript", "json", "python",
        "make", "cmake",
    },
    highlight = {
        enable = true,
        -- disable = { "" },
        additional_vim_regex_higlighting = true,
    },
    indent = { enable = false },
    context_commentstring = {
        enable = true,
        single_line_comment_string = "auto",
        multi_line_comment_strings = "auto",
        config = {
            go = { __default = "// %s", __multiline = "/* %s */" },
            rust = { __default = "// %s", __multiline = "/* %s */" },
            c = { __default = "// %s", __multiline = "/* %s */" },
            python = { __default = "# %s", __multiline = "# %s" },
        },
    },
})

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
