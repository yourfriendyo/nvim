local keymap = vim.keymap
vim.g.mapleader = " " -- 设置主键

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
-- 有两种设置keymap的方式，
-- keymap("", "", "") , keymap.set("", "", "") 后者默认能递归，前者需要在opts中设置


--------------------------------------
-- ----------- 一般模式 --------------
--------------------------------------

keymap.set('n', '<leader>sv', '<C-w>v')                 -- 垂直分割一个窗口
keymap.set('n', '<leader>sh', '<C-w>s')                 -- 水平分割一个窗口
keymap.set('n', '<leader>se', '<C-w>=')                 -- 使拆分窗口保持大小相等
keymap.set('n', '<leader>sx', ':close<cr>')             -- 关闭窗口

keymap.set('n', '<C-h>', '<C-w>h')                      -- 移动到左边窗口
keymap.set('n', '<C-j>', '<C-w>j')                      -- 移动到下边窗口
keymap.set('n', '<C-k>', '<C-w>k')                      -- 移动到上边窗口
keymap.set('n', '<C-l>', '<C-w>l')                      -- 移动到右边窗口

keymap.set('n', '<C-Up>',    ':resize -2<cr>')          -- 向上移动边框
keymap.set('n', '<C-Down>',  ':resize +2<cr>')          -- 向下移动边框
keymap.set('n', '<C-Left>',  ':vertical resize -2<cr>') -- 向左移动边框
keymap.set('n', '<C-Right>', ':vertical resize +2<cr>') -- 向右移动边框

keymap.set('n', '<leader>b', ':tabnew<cr>:e ')          -- 打开一个新的buffer
keymap.set('n', '<leader>x', ':bdelete<cr>')            -- 关闭当前buffer
keymap.set('n', 'H',         ':bprevious<cr>')          -- 移动到上一个buffer
keymap.set('n', 'L',         ':bnext<cr>')              -- 移动到下一个buffer

keymap.set('n', '<leader>nh', ':nohl<cr>')              -- 取消高亮
keymap.set('n', '<leader>nw', ':set nowrap<cr>')        -- 取消折行显示

keymap.set('n', 'x', '"_x')                             -- 使用x删除字符时不会保存到剪切板上

keymap.set('n', 'j', 'gj')                              -- 避免换行显示时移动麻烦
keymap.set('n', 'k', 'gk')

-- mac user
keymap.set("n", "<leader>s", "<cmd>ClangdSwitchSourceHeader<cr>")
keymap.set("n", "<leader>o", "<cmd>ClangdSwitchSourceHeader<cr>")
keymap.set("n", "<leader>u", "<cmd>Trouble lsp_references<cr>")


--------------------------------------
-- ----------- 可视模式 --------------
--------------------------------------

keymap.set("v", "J", ":move '>+1<cr>gv=gv") -- 向下移动当前行
keymap.set("v", "K", ":move '<-2<cr>gv=gv") -- 向上移动当前行
keymap.set("v", "<", "<gv")                 -- 向左移动当前行
keymap.set("v", ">", ">gv")                 -- 向右移动当前行

keymap.set("v", "p", '"_dP') -- 可视模式下粘贴不会改变复制的内容


--------------------------------------
-- ------------- 插件 ----------------
--------------------------------------
-- 要保证如下配置在插件的后面加载

-- Nvim-Tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")     -- 打开NvimTree目录树

-- VimMaximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<cr>")-- 最大化和恢复当前窗口大小

-- Telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files) -- 搜索文件
keymap.set('n', '<leader>lg', builtin.live_grep)  -- 搜索文件内容 require ripgrep
keymap.set('n', '<leader>fb', builtin.buffers)    -- 查找buffer
keymap.set('n', '<leader>fh', builtin.help_tags)  -- 搜索帮助文档

-- Format
keymap.set('n', '<leader>fm', "<cmd>lua vim.lsp.buf.format()<cr>")
keymap.set('v', '<leader>fm', "<esc><cmd>lua vim.lsp.buf.range_formatting()<cr>")

-- Symbol-Outline
keymap.set('n', '<leader>o', ':SymbolsOutline<cr>')

-- Hop
keymap.set("", "f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
keymap.set("", "F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
keymap.set("", "t", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>")
keymap.set("", "T", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>")
-- keymap.set("n", "nn", ":HopChar2<cr>", { silent = true, noremap = true })

-- GitSigns
keymap.set('n', '<leader>hj', ':Gitsigns next_hunk<CR>')           -- 跳转到上一个hunk
keymap.set('n', '<leader>hk', ':Gitsigns prev_hunk<CR>')           -- 跳转到下一个hunk

keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')           -- 添加所在hunk到仓库 git add
keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')  -- 取消添加所在hunk到仓库 git add
keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')     -- 展示当前hunk的修改
keymap.set('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
keymap.set('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
keymap.set('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
keymap.set('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')

--Trouble
keymap.set('n', '<leader>te', ':Trouble workspace_diagnostics<cr>') -- 错误窗口

-- Markdown Perview
keymap.set('n', '<leader>mp', 'PerviewMarkdown tab<cr>')

-- DAP
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint(); require'user.dap.dap-util'.store_breakpoints(true)<cr>")-- 打断点
keymap.set("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>") -- 打条件断点
-- keymap.set("n", "<leader>dr", "lua require'dap'.repl.open()<cr>")
keymap.set("n", "<F9>", "<leader>db")
keymap.set('n', '<C-F5>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>')
keymap.set("n", "<S-F5>", "<cmd>lua require'dap'.terminate()<cr>")                      -- 结束调试
keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>")                         -- 开始调试
keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>")                       -- 逐过程
keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>")                       -- 逐语句
keymap.set("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>")                         -- 跳出当前函数或循环
keymap.set("n", "K", "<cmd>lua require'dapui'.eval()<cr>")                              -- 展开变量信息
-- keymap.set("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>")
-- keymap.set("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>")
