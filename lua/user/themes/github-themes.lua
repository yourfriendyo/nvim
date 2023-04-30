require("github-theme").setup({
    options = {
        styles = {
            functions = {
                "italic",
            },
        },
        darken = {
            sidebars = {"qf", "vista_kind", "terminal", "packer"},
        },
    },
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    -- colors = {hint = "orange", error = "#ff0000"},
    specs = {
        github_dark = {
            diag = {
                error = { fg = '#ff0000' },
                hint = { "orange" },
            },
        },
        all = {
            diag = {
                error = { fg = '#ff0000' },
                hint = { "orange" },
            },
        },
    },
    groups = {
        all = {
            htmlTag = {
                bg = "#282c34", 
                style = "underline"
            },
        },
        -- this will remove the highlight groups
        TSField = {},
    },
})
