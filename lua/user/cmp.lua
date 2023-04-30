local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

---checks if emmet_ls is available and active in the buffer
---@return boolean true if available, false otherwise
local is_emmet_active = function()
  local clients = vim.lsp.buf_get_clients()

  for _, client in pairs(clients) do
    if client.name == "emmet_ls" then
      return true
    end
  end
  return false
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").load({ path = {
    vim.fn.stdpath("config") .. "/my-snippets",
}})

local kind_icons = {
      Class = " ",      Color = " ",         Constant = "ﲀ ",  Constructor = " ", Enum = "練",
      EnumMember = " ", Event = " ",         Field = " ",     File = "",         Folder = " ",
      Function = " ",   Interface = "ﰮ ",     Keyword = " ",   Method = " ",      Module = " ",
      Operator = "",    Property = " ",      Reference = " ", Snippet = " ",     Struct = " ",
      Text = " ",       TypeParameter = " ", Unit = "塞",      Value = " ",       Variable = " ",
}

-- 下面会用到这个函数
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>']    = cmp.mapping.select_prev_item(), -- 向上移动提示信息
        ['<C-j>']    = cmp.mapping.select_next_item(), -- 向下移动提示信息
        ['<C-b>']    = cmp.mapping.scroll_docs(-4),    -- 向上移动预览提示框
        ['<C-f>']    = cmp.mapping.scroll_docs(4),     -- 向下移动预览提示框
        ['C-Space>'] = cmp.mapping.complete(),
        ['<C-y>']    = cmp.config.disable,
        ['<C-e>']    = cmp.mapping { -- 取消补全
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<CR>']     = cmp.mapping.confirm({ select = true }), -- 选择
        ["<Tab>"]    = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            elseif is_emmet_active() then
                return vim.fn["cmp#complete"]()
            else
                fallback()
            end
        end,
        {
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
        end,
        {
            "i",
            "s",
        }),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp'    },
        { name = 'buffer'      },
        { name = 'luasnip'     },
        { name = 'cmp_tabnine' },
        { name = 'path'        },
    }),

    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local max_width = 0
            if max_width ~= 0 and #vim_item.abbr > max_width then
                vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
            end

            vim_item.kind =  kind_icons[vim_item.kind]
            -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp    = "[LSP]",
                cmp_tabnine = "TabNine",
                luasnip     = "[Snip]",
                buffer      = "[Buffer]",
                path        = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    flag = {
        debounce_text_changes = 150,
    },
    confirm_opts = {
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline('?', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' },
    }, {
        { name = 'path' },
    })
})
