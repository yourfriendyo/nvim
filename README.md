# neovim配置

- 使用支持 nerd font 字体的终端
- neovim version >= 0.7，以及 cmake, fd, rg, glow, mdr, ripgrep

>[此处](https://github.com/neovim/neovim/releases)手动下载

```shell
yum install neovim cmake fd rg glow mdr ripgrep -y
```

  ```shell
  git clone https://gitee.com/yourfriendyo/config.git ~/.config/config/nvim
  mv ~/.config/config/nvim ~/.config/
  ```

1. 进入`nvim`
2. `:Lazy`自动下载插件
3. `:Mason`进入界面后选择想要的`lsp`服务器，输入`i`进行安装，`X`卸载。

## 常用快捷键

`<leader>`键已被设置为`space`，可在`core/keymap.lua`修改。

### 1. 常规动作

| 快捷键          | 功能                        |
| --------------- | --------------------------- |
| `<leader>e`     | 开关目录树                  |
| `<leader>o`     | 打开大纲                    |
| `<leader>ff`    | 搜索文件                    |
| `<leader>lg`    | 搜索字符                    |
| `H`             | 切换左边标签页              |
| `L`             | 切换右边标签页              |
| `<ctrl>h/j/k/l` | 进入左边/下边/上边/右边窗口 |
| `<ctrl>\`       | 打开内置终端                |
| `<leader>b`     | 打开新标签页并命名文件      |
| `<leader>x`     | 关闭标签页                  |
| `<leader>fm`    | 格式化代码                  |
| `gcc`/`gc`      | 单行/多行注释               |
| `<leader>nh`    | 取消高亮                    |

### 2. 目录树

| 快捷键  | 功能                      |
| ------- | ------------------------- |
| **`o`** | **打开文件/打开文件目录** |
| `h`     | 折叠一个层级目录          |
| `d`     | 删除文件                  |
| **`a`** | **新建文件/新建文件夹**   |
| `r`     | 重命名文件                |
| `x`     | 剪切文件                  |
| `p`     | 粘贴                      |
| `gy`    | 拷贝文件绝对路径          |
| `Y`     | 拷贝文件相对路径          |
| `y`     | 拷贝文件名                |

### 3. 代码导航

| 快捷键           | 功能                      |
| ---------------- | ------------------------- |
| **`gd`**         | **跳转代码定义/声明**     |
| `]]`             | 跳转到下一个函数头        |
| `][`             | 跳转到下一个函数尾        |
| `[[`             | 跳转到上一个函数头        |
| `[]`             | 跳转到上一个函数尾        |
| **`gh`**         | **查看函数签名+注释文档** |
| **`<leader>rn`** | **重命名符号**            |
| `<leader>dj`     | 下一个错误                |
| `<leader>dk`     | 上一个错误                |
| **`<leader>te`** | **错误窗口**              |

### 4. Git操作

| 快捷键       | 功能         |
| ------------ | ------------ |
| `<leader>j`  | 下一个hunk   |
| `<leader>k`  | 上一个hunk   |
| `<leader>hs` | stage hunk   |
| `<leader>hu` | unstage hunk |
| `<leader>hr` | reset hunk   |
| `<leader>hp` | preview hunk |
| `<leader>gd` | diff file    |
| `<leader>gf` | file history |

### 5. Debug

| 快捷键       | 功能                                            |
| ------------ | ----------------------------------------------- |
| `<leader>db` | 开关断点                                        |
| `<F5>/<F10>` | 开始调试/continue                               |
| `<F10>`      | 逐过程                                          |
| `<F11>`      | 逐语句                                          |
| `K`          | 变量悬浮窗（查看变量值, 按两次`K`聚焦到悬浮窗） |
