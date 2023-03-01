local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local lspkind_status_ok , lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
    return
end


require("luasnip.loaders.from_vscode").lazy_load()

-- 下面会用到这个函数
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>']    = cmp.mapping.select_prev_item(), -- 向上移动提示信息
        ['<C-j>']    = cmp.mapping.select_next_item(), -- 向下移动提示信息
        ['<C-b>']    = cmp.mapping.scroll_docs(-4),    -- 向上移动4格
        ['<C-f>']    = cmp.mapping.scroll_docs(4),     -- 向下移动4格
        ['C-Space>'] = cmp.mapping.complete(),
        ['<C-y>']    = cmp.config.disable,
        ['<C-e>']    = cmp.mapping.abort(),                    -- 取消补全
        ['<CR>']     = cmp.mapping.confirm({ select = true }), -- 选择此提示
        ["<Tab>"]    = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    }),

    -- 如果要安装其他自动补全插件，记得在下方引用
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip'  },
        { name = 'buffer'   },
        { name = 'path'     },
    }),
    -- 格式化
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = '...',
        })
    },
    confirm_opts = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
})
