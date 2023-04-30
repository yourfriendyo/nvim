local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    ------------------------
    -- Colorscheme, UI
    ------------------------

        'catppuccin/nvim',
    --  'projekt0n/github-nvim-theme',
    --  'martinsione/darkplus.nvim',

    {
        "akinsho/bufferline.nvim",  -- buffer
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("user.bufferline")
        end,
    },
    {
        'nvim-lualine/lualine.nvim', -- status line
        config = function()
            require("user.lualine")
        end,
    },
    {
        "lewis6991/gitsigns.nvim", -- git line
        config = function()
            require("user.gitsigns")
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("user.indent-blankline")
        end
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require("user.alpha")
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require("user.illuminate")
        end
    },
    -- {
    --     'folke/noice.nvim',
    --     dependencies = {
    --         'rcarriga/nvim-notify',
    --         config = function()
    --             require("user.notify")
    --         end,
    --     },
    --     config = function()
    --         require('noice').setup()
    --     end,
    -- },
    {
        'rcarriga/nvim-notify',
        config = function()
            require("user.notify")
        end,
    },

    -- { "p00f/nvim-ts-rainbow" },

    -----------------------
    -- Move
    -----------------------

    {
        'phaazon/hop.nvim',
        branch = 'v2',
        dependencies = {
            'ggandor/leap.nvim',
        },
        config = function()
            require("user.hop")
        end
    },
    'aserowy/tmux.nvim',
    -- { 'szw/vim-maximizer' },

    ------------------------
    -- Cmp & Snip
    ------------------------
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("user.cmp")
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("user.autopairs")
        end
    },
    { 'nvim-lua/popup.nvim' },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("user.luasnip").setup()
        end,
    },
    { "rafamadriz/friendly-snippets" },

    ------------------------
    -- LSP
    ------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'romgrk/nvim-treesitter-context',
        },
        config = function()
            require("user.treesitter")
        end,
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            'kosayoda/nvim-lightbulb',
            {
                "neovim/nvim-lspconfig",
                config = function()
                    require("user.lsp.lspconfig")
                end
            },
        },
        config = function()
            require("user.lsp.mason")
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("user.lsp.lsp-signature").setup()
        end,
    },
    {
        "lvimuser/lsp-inlayhints.nvim",
        branch = "anticonceal",
        config = function()
            require("user.lsp.lsp-inlayhints").setup()
        end,
    },

    ------------------------
    -- Format & Lint
    ------------------------
    -- 'jose-elias-alvarez/null-ls.nvim',
    -- 'jayp0521/mason-null-ls.nvim',

    ------------------------
    -- Tools
    ------------------------
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("user.nvim-tree")
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup()
        end
    },
    'folke/todo-comments.nvim',
    'ldelossa/litee.nvim',
    'ldelossa/litee-calltree.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-telescope/telescope-ui-select.nvim',
            'nvim-telescope/telescope-media-files.nvim',
            {
                'tom-anders/telescope-vim-bookmarks.nvim',
                after = 'MattersGroeger/vim-bookmarks',
            },
        },
        config = function()
            require("user.telescope")
        end,
    },
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require("user.toggleterm")
        end,
    },
    -- {
    --     'lewis6991/impatient.nvim',
    --     config = function()
    --         require("user.impatient").setup()
    --     end
    -- },

    {
        'ethanholz/nvim-lastplace',
        config = function()
            require("user.lastplace")
        end,
    },

    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup()
        end
    },
    -- {'chipsenkbeil/distant.nvim'},

    -- {
    --     "gen740/SmoothCursor.nvim",
    --     config = function()
    --         require("user.smoothcursor").setup()
    --     end,
    -- },
    {
        "stevearc/aerial.nvim", -- a code outline window for skimming and quick navigation
        config = function()
            require("user.aerial").setup()
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup()
            -- require("user.colorizer").setup()
        end,
    },
    -- { "sindrets/diffview.nvim" },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup({
                window = {
                    border = "rounded",
                },
            })
        end,
    },
    {
        "utilyre/barbecue.nvim", -- a nice lsp prompt
        dependencies = { "SmiteshP/nvim-navic", },
        -- configurations go here
        opts = {},
    },
    -- { "rest-nvim/rest.nvim", }, -- http client, need treesitter support http json
    {
        "skanehira/preview-markdown.vim", -- need install glow and mdr
        config = function()
            vim.g.preview_markdown_vertical=1
            vim.g.preview_markdown_parser='glow'
        end
    },
    -- {
    --     "tpope/vim-dadbod", -- a mysql client
    --     dependencies = {
    --         "kristijanhusak/vim-dadbod-ui",
    --     },
    -- },
    {
        'michaelb/sniprun',
        run = 'sh ./install.sh', -- mac user must Compile it self use rust
        config = function()
            require("sniprun").setup({
                display = {
                    "Classic",                    -- display results in the command-line  area
                    "VirtualTextOk",              -- display ok results as virtual text (multiline is shortened)
                    "VirtualTextErr",             -- display error results as virtual text
                    -- "TempFloatingWindow",      -- display results in a floating window
                    -- "LongTempFloatingWindow",  -- same as above, but only long results. To use with VirtualText__
                    "Terminal",                   -- display results in a vertical split
                    -- "TerminalWithCode",        -- display results and code history in a vertical split
                    "NvimNotify",                 -- display with the nvim-notify plugin
                    -- "Api",                     -- return output to a programming interface
                },
                borders = 'single',
            })
        end,
    },
    {
        'djoshea/vim-autoread',
        dependencies = {
            'Pocco81/AutoSave.nvim',
            config = function()
                require("user.autosave")
            end
        },
    },
    'nvim-pack/nvim-spectre', -- search and replace
    'tpope/vim-surround',

    ------------------------
    -- DAP
    ------------------------

    {
        "ravenxrz/DAPInstall.nvim", -- install debuggers
        dependencies = {
            "ravenxrz/nvim-dap",
            {
                "ravenxrz/nvim-gdb",
                run = "./install.sh"
            }
        },
        config = function()
            require("user.dap.dap-util")
            require("user.dap.dap-config").setup()
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("user.dap.dap-virtual-text")
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("user.dap.dap-ui")
        end
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("user.trouble")
        end
    },

    -- "mfussenegger/nvim-dap-python"    -- debug python
    -- { "leoluz/nvim-dap-go", module = "dap-go" } -- debug golang

}

local opts = {
    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = true,    -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
}

require('lazy').setup(plugins, opts)
