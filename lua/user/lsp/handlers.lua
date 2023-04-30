local status_lsp_ok, lspconfig    = pcall(require, "lspconfig")
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local status_ill_ok, illuminate   = pcall(require, "illuminate")

if not status_lsp_ok or not status_cmp_ok or not status_ill_ok then
    vim.notify("lspconfig not found!")
end

local M = {}

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr } -- keybind options
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD",         "<cmd>lua vim.lsp.buf.declaration()<cr>"            , opts)
    keymap(bufnr, "n", "gd",         "<cmd>lua vim.lsp.buf.definition()<cr>"             , opts)
    keymap(bufnr, "n", "gh",         "<cmd>lua vim.lsp.buf.hover()<cr>"                  , opts)
    keymap(bufnr, "n", "gl",         "<cmd>lua vim.diagnostic.open_float()<cr>"          , opts)
    keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>"                 , opts)
    keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>"   , opts)
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>"                                  , opts)
    keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>"                           , opts)
    keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>"            , opts)
    keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>" , opts) -- 跳转上一个
    keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>" , opts) -- 跳转下一个
    keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>"          , opts)
    -- keymap(bufnr, "n", "gr",         "<cmd>lua vim.lsp.buf.references()<cr>"             , opts) -- gd can handler that
    -- keymap(bufnr, "n", "gI",         "<cmd>lua vim.lsp.buf.implementation()<cr>"         , opts)
    -- keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>"         , opts)
end


M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    illuminate.on_attach(client) -- lsp_highlight_document

    require("aerial").on_attach(client, bufnr)
    require("lsp_signatrue").on_attach()
end


M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

return M
