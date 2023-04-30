-- 自动安装和设置packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })

        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

require('packer').startup(function(use)
    -- packer mananger
    use { 'wbthomason/packer.nvim' }

    -- colors themes
    use {
        'catppuccin/nvim',
        require = {
            'kyazdani42/nvim-web-devicons',
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            'nvim-lua/popup.nvim'
        }
    }
    use { 'projekt0n/github-nvim-theme' }
    use { 'martinsione/darkplus.nvim' }

    use {
        "akinsho/bufferline.nvim",
        config = function()
            require("user.bufferline")
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("user.lualine")
        end

    }
    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("user.nvim-tree")
        end

    }
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("user.gitsigns")
        end
    }
    -- use "p00f/nvim-ts-rainbow"

    -- window movetion
    use {
        's1n7ax/nvim-window-picker',
    }
    use { 'aserowy/tmux.nvim' }
    use {
        "christoomey/vim-tmux-navigator",
    }
    use {
        "szw/vim-maximizer",
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        require = {
            "ggandor/leap.nvim",
        },
        config = function()
            require("user.hop")
        end
    }

    -- compeletion
    use {
        "hrsh7th/nvim-cmp",
        require = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("user.cmp")
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("user.autopairs")
        end
    }

    -- snippets
    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("user.luasnip").setup()
        end
    }
    use {
        "rafamadriz/friendly-snippets",
    }

    -- lsp
    use {
        "nvim-treesitter/nvim-treesitter", -- 语法高亮
        require = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'romgrk/nvim-treesitter-context',
        },
        config = function()
            require("user.treesitter")
        end
    }

    use {
        "williamboman/mason.nvim",
        require = {
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("user.lsp.lspconfig")
                end
            },
            "neovim/nvim-lspconfig",
            'kosayoda/nvim-lightbulb',
        },
        config = function()
            require("user.lsp.mason")
        end
    }
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("user.lsp.lsp-signature").setup()
        end
    }
    use {
        "lvimuser/lsp-inlayhints.nvim",
        config = function()
            require("user.lsp.lsp-inlayhints").setup()
        end
    }

    -- format & lint
    -- use { "jose-elias-alvarez/null-ls.nvim" }
    -- use { "jayp0521/mason-null-ls.nvim" }

    -- tools
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    } -- gcc和gc注释
    use {
        'folke/todo-comments.nvim',
    }
    use {
        'MattersGroeger/vim-bookmarks',
    }
    use {
        "nvim-telescope/telescope.nvim",
        require = {
            'nvim-telescope/telescope-media-files.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            'tom-anders/telescope-vim-bookmarks.nvim',
        },
        config = function()
            require("user.telescope")
        end
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require("user.toggleterm")
        end
    }
    use {
        'lewis6991/impatient.nvim',
        config = function()
            require("user.impatient").setup()
        end
    }
    use {
        'rcarriga/nvim-notify',
        config = function()
            require("user.notify")
        end
    }
    use {
        'ethanholz/nvim-lastplace',
        config = function()
            require("user.lastplace")
        end
    }

    use {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup()
        end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("user.indent-blankline")
        end
    }
    use {
        'goolord/alpha-nvim',
        config = function()
            require("user.alpha")
        end
    }
    use {
        "RRethy/vim-illuminate",
        config = function()
            require("user.illuminate")
        end
    }
    use {
        'chipsenkbeil/distant.nvim',
    }
    use {
        'ldelossa/litee.nvim',
    }
    use {
        'ldelossa/litee-calltree.nvim',
    }
    use {
        "stevearc/aerial.nvim",
        config = function()
            require("user.aerial").setup()
        end
    }

    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup()
        end
    }
    -- "sindrets/diffview.nvim"
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup({
                window = {
                    border = "rounded",
                }
            })
        end
    }
    use {
        "utilyre/barbecue.nvim",
        require = { "SmiteshP/nvim-navic", },
    }
    -- use { "rest-nvim/rest.nvim", }, -- http client, need treesitter support http json
    use {
        "skanehira/preview-markdown.vim", -- need install glow and mdr
        config = function()
            vim.g.preview_markdown_vertical = 1
            vim.g.preview_markdown_parser = 'glow'
        end
    }
    use {
        'djoshea/vim-autoread',
        require = {
            'Pocco81/AutoSave.nvim',
            config = function()
                require("user.autosave")
            end
        },
    }
    use {
        'michaelb/sniprun',
        run = 'sh ./install.sh', -- mac user must Compile it self use rust
        config = function()
            require("sniprun").setup({
                display = {
                    "Classic",        -- display results in the command-line  area
                    "VirtualTextOk",  -- display ok results as virtual text (multiline is shortened)
                    "VirtualTextErr", -- display error results as virtual text
                    -- "TempFloatingWindow",      -- display results in a floating window
                    -- "LongTempFloatingWindow",  -- same as above, but only long results. To use with VirtualText__
                    "Terminal",   -- display results in a vertical split
                    -- "TerminalWithCode",        -- display results and code history in a vertical split
                    "NvimNotify", -- display with the nvim-notify plugin
                    -- "Api",                     -- return output to a programming interface
                },
                borders = 'single',
            })
        end,
    }

    -- {
    --     "tpope/vim-dadbod", -- a mysql client
    --     dependencies = {
    --         "kristijanhusak/vim-dadbod-ui",
    --     },
    -- },

    use {
        'nvim-pack/nvim-spectre', -- search and replace
    }
    use {
        'tpope/vim-surround',
    }

    ------------------------
    -- DAP
    ------------------------

    use {
        "ravenxrz/DAPInstall.nvim", -- install debuggers
        require = {
            "ravenxrz/nvim-dap",
            {
                "ravenxrz/nvim-gdb",
                run = "./install.sh"
            }
        },
        config = function()
            require("user.dap.dap-config").setup()
        end
    }
    use {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("user.dap.dap-virtual-text")
        end
    }

    use {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("user.dap.dap-util")
            require("user.dap.dap-ui")
        end
    }
    use {
        "folke/trouble.nvim",
        config = function()
            require("user.trouble")
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
