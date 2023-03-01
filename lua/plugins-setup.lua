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
    use 'nvim-lualine/lualine.nvim'            -- 底部状态栏
    use 'nvim-tree/nvim-tree.lua'              -- 文件树
    use "akinsho/bufferline.nvim"              -- buffer分割线
    use "lewis6991/gitsigns.nvim"              -- git提示
    -- use "p00f/nvim-ts-rainbow"                  -- 彩虹括号

    -- move 
    use "christoomey/vim-tmux-navigator"       -- ctrl+hjkl定位窗口
    use "szw/vim-maximizer"                    -- 最大化和恢复当前窗口
    use { 'phaazon/hop.nvim', branch = 'v2' }  -- optional but strongly recommended
    use "ggandor/leap.nvim"

    -- cmpletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "windwp/nvim-autopairs" -- 自动补全括号

    -- snippets
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
    use "numToStr/Comment.nvim" -- gcc和gc注释
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use 'akinsho/toggleterm.nvim'  -- float terminal


    if packer_bootstrap then
        require('packer').sync()
    end
end)
