-- 自动安装和设置packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

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

return require('packer').startup(function(use)
    -- packer mananger
    use 'wbthomason/packer.nvim'

    -- colors themes
    use 'catppuccin/nvim'
    use 'kyazdani42/nvim-web-devicons'         -- 图标
    use "MunifTanjim/nui.nvim"
    use 'projekt0n/github-nvim-theme'
    use 'martinsione/darkplus.nvim'

    use "akinsho/bufferline.nvim"              -- 顶部buff栏
    use 'nvim-lualine/lualine.nvim'            -- 底部状态栏
    -- use 'nvim-neo-tree/neo-tree.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use "lewis6991/gitsigns.nvim"              -- git提示
    use "p00f/nvim-ts-rainbow"                 -- 彩虹括号

    -- window movetion
    use 's1n7ax/nvim-window-picker'
    use "christoomey/vim-tmux-navigator"       -- ctrl+hjkl定位窗口
    use "szw/vim-maximizer"                    -- 最大化和恢复当前窗口
    use { 'phaazon/hop.nvim', branch = 'v2' }  -- 
    use "ggandor/leap.nvim"

    -- compeletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "windwp/nvim-autopairs" -- 自动补全括号

    -- snippets
    use "nvim-lua/plenary.nvim"
    use 'nvim-lua/popup.nvim'
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- lsp 
    use "nvim-treesitter/nvim-treesitter"  -- 语法高亮
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use { "glepnir/lspsaga.nvim", branch = "main" }
    use "onsails/lspkind.nvim"

    -- format & lint
    use "jose-elias-alvarez/null-ls.nvim"
    use "jayp0521/mason-null-ls.nvim"

    -- debug
    -- use "ravenxrz/nvim-dap"
    -- use "theHamsta/nvim-dap-virtual-text"
    -- use "rcarriga/nvim-dap-ui"
    -- use "nvim-telescope/telescope-dap.nvim"

    -- tools
    use "numToStr/Comment.nvim"                     -- gcc和gc注释
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'akinsho/toggleterm.nvim'                   -- 浮动终端 
    use 'lewis6991/impatient.nvim'                  -- 提高插件加载效率
    use 'rcarriga/nvim-notify'
    use 'ethanholz/nvim-lastplace'                  -- 打开后自动到上次修改位置

    use "simrat39/symbols-outline.nvim"             -- 代码大纲
    use 'lukas-reineke/indent-blankline.nvim'       -- 缩进提示线
    use 'goolord/alpha-nvim'                        -- 面板
    use "RRethy/vim-illuminate"                     -- 光标提示线
    use 'chipsenkbeil/distant.nvim'                 -- 远程开发


    if packer_bootstrap then
        require('packer').sync()
    end
end)
