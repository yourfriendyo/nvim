local colorscheme = "catppuccin"
-- local colorscheme = "github-nvim-theme"
-- local colorscheme = "darkplus"

-- cursor color: #61AFEF

if colorscheme == "catppuccin" then
   require("user.themes.catppuccin")
elseif colorscheme == "onedark" then
   require("user.themes.onedark")
elseif colorscheme == "github-nvim-theme" then
   require ("user.themes.github-nvim-theme")
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd("colorscheme catppuccin") -- 重新设置主题以解决光标颜色问题
