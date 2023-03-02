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
-- keymap("", "", "", opts) , keymap.set("", "", "") 后者默认能递归，前者需要在opts中设置

-- ----------- 一般模式 --------------

keymap.set("n", "<leader>sv", "<C-w>v") -- 垂直分割一个窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 水平分割一个窗口
keymap.set("n", "<leader>se", "<C-w>=") -- 使拆分窗口保持大小相等
keymap.set("n", "<leader>sx", ":close<CR>") -- 关闭窗口

keymap.set("n", "<leader>to", ":tabnew<CR>") -- 打开一个新标签页
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- 关闭当前标签页
keymap.set("n", "<leader>tn", ":tabnext<CR>") -- 切换下一个标签页
keymap.set("n", "<leader>tp", ":tabprevious<CR>") -- 切换上一个标签页

-- keymap.set("n", "<C-h>", "<C-w>h")  -- ctrl+h 移动到左边窗格
-- keymap.set("n", "<C-j>", "<C-w>j")  -- ctrl+j 移动到下边窗格
-- keymap.set("n", "<C-k>", "<C-w>k")  -- ctrl+k 移动到上边窗格
-- keymap.set("n", "<C-l>", "<C-w>l")  -- ctrl+l 移动到右边窗格

keymap.set("n", "<C-Up>", ":resize -2<CR>") -- 向上移动边框
keymap.set("n", "<C-Down>", ":resize +2<CR>") -- 向下移动边框
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>") -- 向左移动边框
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>") -- 向右移动边框

keymap.set("n", "<leader>nh", ":nohl<CR>") -- 取消高亮
keymap.set("n", "x", '"_x') -- 使用x删除字符时不会保存到剪切板上

-- ----------- 可视模式 --------------

keymap.set("v", "J", ":move '>+1<CR>gv=gv") -- 向下移动当前行
keymap.set("v", "K", ":move '<-2<CR>gv=gv") -- 向上移动当前行
keymap.set("v", "<", "<gv") -- 向左移动当前行
keymap.set("v", ">", ">gv") -- 向右移动当前行

keymap.set("v", "p", '"_dP') -- 可视模式下粘贴不会改变复制的内容

-- ----------- 插件 --------------

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- buffer
keymap.set("n", "H", ":bprevious<CR>")
keymap.set("n", "L", ":bnext<CR>")
keymap.set("n", "<C-w>", ":bdelete<CR>")


-- 最大化和恢复当前窗口大小
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files)
keymap.set('n', '<leader>fg', builtin.live_grep) -- require ripgrep
keymap.set('n', '<leader>fb', builtin.buffers)
keymap.set('n', '<leader>fh', builtin.help_tags)

-- format
keymap.set('n', '<leader>fm', "<cmd>lua vim.lsp.buf.format()<cr>")

-- outline
keymap.set('n', '<leader>fo', ':SymbolsOutline<cr>')

