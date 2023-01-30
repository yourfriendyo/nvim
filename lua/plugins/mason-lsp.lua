local keymap = vim.keymap

local on_attach = function(client, bufnr)
      -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- show definition, references
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    -- got to declaration
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    -- see definition and make edits in window
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    -- go to implementation
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- see available code actions
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    -- smart rename
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    -- show  diagnostics for line
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    -- show diagnostics for cursor
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    -- jump to previous diagnostic in buffer
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    -- jump to next diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    -- show documentation for what is under cursor
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    -- see outline on right hand side
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").sumneko_lua.setup ({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").clangd.setup ({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "sumneko_lua",
        "clangd"
    }
})

require("lspsaga").setup({
    move_in_saga = { prev = "<C-k>", next = "<C-j" },
    finder_action_keys = {
        open = "<CR>",
    },
    definition_action_keys = {
        edit = "<CR>",
    },
})
