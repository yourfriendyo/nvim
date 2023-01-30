local keymap = vim.keymap

vim.g.mapleader = " " -- 设置主键

-- ----------- 可视模式 --------------

-- 移动行
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- ----------- 一般模式 --------------

-- 多窗口
keymap.set("n", "<leader>sv", "<C-w>v")     -- 垂直分割一个窗口
keymap.set("n", "<leader>sh", "<C-w>s")     -- 水平分割一个窗口
keymap.set("n", "<leader>se", "<C-w>=")     -- 使拆分窗口保持大小相等
keymap.set("n", "<leader>sx", ":close<CR>") -- 关闭窗口

keymap.set("n", "<leader>to", ":tabnew<CR>")      -- 打开一个新标签页
keymap.set("n", "<leader>tx", ":tabclose<CR>")    -- 关闭当前标签页
keymap.set("n", "<leader>tn", ":tabnext<CR>")     -- 切换下一个标签页
keymap.set("n", "<leader>tp", ":tabprevious<CR>") -- 切换上一个标签页


keymap.set("n", "<leader>nh", ":nohl<CR>") -- 取消高亮
keymap.set("n", "x", '"_x')                -- 使用x删除字符时不会保存到剪切板上


-- ----------- 插件 --------------

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- 切换buffer
keymap.set("n", "H", ":bprevious<CR>")
keymap.set("n", "L", ":bnext<CR>")

-- 最大化和恢复当前窗口大小
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
