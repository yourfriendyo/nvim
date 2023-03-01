local opt = vim.opt

-- opt.guifont = "monospace:h17"               -- the font used in graphical neovim 
-- opt.numberwidth = 4                         -- set number column width to 2 {default 4}
-- opt.cmdheight = 2                           -- 底部提示栏高度

opt.updatetime = 300                         -- 插件状态更新时间
opt.whichwrap = "bs<>[]hl"                   -- 
opt.showmode = false                         -- 不显示nvim的模式提示

opt.scrolloff = 8                            -- 
opt.sidescrolloff = 8                        -- 

opt.backup = false                           -- 关闭备份文件
opt.writebackup = false                      -- 不允许使用写入的备份文件
opt.undofile = false                         -- 重新打开文件后是否允许撤回上次的修改
opt.swapfile = false                         -- 不使用交换文件
opt.fileencoding = "utf-8"                   -- 写入文件使用编码utf8

opt.showtabline = 2                          -- 始终展示标签页标题
opt.pumheight = 10                           -- pop up menu height
opt.completeopt = { "menuone", "noselect" }  -- mostly just for cmp

opt.relativenumber = true                    -- 设置相对行号
opt.number = true

opt.tabstop = 4                              -- 设置4个空格为缩进
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = true                              -- 换行显示
opt.linebreak = true                         -- 换行时不拆分单词
opt.mouse:append("a")                        -- 启用鼠标
opt.clipboard:append("unnamedplus")          -- 启用系统剪切板

opt.backspace = "indent,eol,start"           -- 保证退格键正确运行
opt.iskeyword:append("-")                    -- 将-作为单词的一部分

opt.splitright = true                        -- 默认新窗口在下和右
opt.splitbelow = true

opt.ignorecase = true                        -- 搜索忽略大小写
opt.smartcase = true

opt.cursorline = true                        -- 高亮所在行
opt.termguicolors = true                     -- 使用256色
opt.signcolumn = "yes"                       -- 总是显示左边的符号提示列
