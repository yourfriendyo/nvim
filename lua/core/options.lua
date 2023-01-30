local opt = vim.opt

opt.relativenumber = true          -- 设置相对行号
opt.number = true

opt.tabstop = 4                    -- 设置4个空格为缩进
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = true                     -- 换行显示
opt.mouse:append("a")               -- 启用鼠标
opt.clipboard:append("unnamedplus") -- 启用系统剪切板

opt.backspace = "indent,eol,start"  -- 保证退格键正确运行
opt.iskeyword:append("-")           -- 将-作为单词的一部分

opt.splitright = true               -- 默认新窗口在下和右
opt.splitbelow = true

opt.ignorecase = true               -- 搜索忽略大小写
opt.smartcase = true

opt.cursorline = true               -- 高亮所在行
opt.termguicolors = true            -- 使用256色
opt.signcolumn = "yes"

vim.cmd.colorscheme "catppuccin"    -- 设置主题
