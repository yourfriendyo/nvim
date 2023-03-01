local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = false,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 3,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local opts = { noremap = true, silent = true }

vim.api.nvim_buf_set_keymap(0, 'n', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
vim.api.nvim_buf_set_keymap(0, 'n', '<C-l>', [[<C-\><C-n><C-W>l]], opts)

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
