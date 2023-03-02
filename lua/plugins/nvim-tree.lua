vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },

    renderer = {
        root_folder_modifier = ":t",
        add_trailing = true,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "╰", edge = "│", item = "│", bottom = "-", none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true, folder = true, folder_arrow = false, git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                folder = {
                    arrow_closed = "", arrow_open = "", default = "", open = "",
                    empty = "",        empty_open = "", symlink = "", symlink_open = "",
                },
                git = {
                    unstaged = "✗",  staged = "✓",  unmerged = "", renamed = "➜",
                    untracked = "*", deleted = "", ignored = "◌",
                },
            },
        },
    },

    disable_netrw = true,
    hijack_netrw = true,
    -- ignore_ft_on_setup = {
    --     "startify",
    --     "dashboard",
    --     "alpha",
    -- },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    diagnostics = {
        enable = false,
        show_on_dirs = true,
        icons = {
            hint = "", info = "", warning = "", error = "",
        },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        side = "left",
        adaptive_size = true,
        centralize_selection = true,
        hide_root_folder = false,
        preserve_window_proportions = true,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        -- @deprecated
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<cr>", "o"}, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
        float = {
            enable = false,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },
    },

    auto_reload_on_write = true,
    create_in_closed_folder = false,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    ignore_buf_on_tab_change = {},
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = false,
    reload_on_bufenter = true,
    respect_buf_cwd = false,
    on_attach = "disable", -- function(bufnr). If nil, will use the deprecated mapping strategy
    remove_keymaps = false, -- boolean (disable totally or not) or list of key (lhs)
})

