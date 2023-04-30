vim.g.mapleader = " "
vim.g.maplocalleader = " "

local options = {
	fileencoding = "utf-8",         -- the encoding written to a file
	backup = false,                 -- disable create backup files 
	writebackup = false,            -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	swapfile = false,               -- creates a swapfile

	updatetime = 300,               -- samller updatetime faster completion (4000ms default)
	timeoutlen = 150,               -- time to wait for a mapped sequence to complete (in milliseconds)

	completeopt = { "menuone", "noselect", "noinsert", "menu" }, -- for auto complete option, mostly just for cmp

	clipboard = "unnamedplus",      -- allows to access system clipboard

	cmdheight = 1,                  -- keep status bar position close to bottom
	conceallevel = 0,               -- so that `` is visible in markdown files
	hlsearch = true,                -- highlight all matches on previous search pattern
	ignorecase = true,              -- ignore case in search patterns
	mouse = "a",                    -- disable mouse completely
	pumheight = 10,                 -- pop up menu height
	showmode = false,               -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2,                -- [0: never show, 1: if has more than 2tabs , 2 : always]
	smartcase = true,               -- smart case
	smartindent = true,             -- make indenting smarter again
	splitbelow = true,              -- force all horizontal splits to go below current window
	splitright = true,              -- force all vertical splits to go to the right of current window
	termguicolors = true,           -- set term gui colors (most terminals support this)
	undofile = true,                -- enable persistent undo
	expandtab = true,               -- convert tabs to spaces
	shiftwidth = 4,                 -- the number of spaces inserted for each indentation
	tabstop = 4,                    -- insert 4 spaces for a tab
	cursorline = true,              -- highlight the current line
	cursorcolumn = false,           -- no highlight the cursor column.
	number = true,                  -- set numbered lines
	relativenumber = true,          -- set relative numbered lines
	numberwidth = 4,                -- set number column width to 2 {default 4}
	signcolumn = "yes",             -- always show the sign column, otherwise it would shift the text each time
	colorcolumn = "160",            -- always show the sign column, otherwise it would shift the text each time
	wrap = true,                    -- display lines as one long line
	scrolloff = 8,                  -- keep 8 height offset from above and bottom
	sidescrolloff = 8,              -- keep 8 width offset from left and right
	foldmethod = "expr",            -- fold with nvim_treesitter
	foldexpr = "nvim_treesitter#foldexpr()",
	foldenable = false,             -- no fold to be applied when open a file
	foldlevel = 99,                 -- if not set this, fold will be everywhere
	spell = false,                  -- add spell support
	spelllang = { "en_us" },        -- support which languages?
	diffopt = "vertical,filler,internal,context:4", -- vertical diff split view
	-- cscopequickfix="s-,c-,d-,i-,t-,e-",       -- cscope output to quickfix window
	confirm = false,
}

for key, val in pairs(options) do
	vim.opt[key] = val
end
