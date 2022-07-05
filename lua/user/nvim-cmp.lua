local luasnip = require "luasnip"
require("luasnip.loaders.from_vscode").lazy_load()

local lspkind = require "lspkind"

local cmp = require "cmp"
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
        ["<C-y>"] = cmp.mapping.complete(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-f>"] = cmp.mapping.scroll_docs(2),
        ["<C-b>"] = cmp.mapping.scroll_docs(-2),
        ["<CR>"] = cmp.mapping.confirm {select = true},
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end
        )
    },
    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = lspkind.cmp_format({
            mode = "symbol",
            menu = ({
                buffer = " [Buffer]",
                -- nvim_lsp = " [LSP]",
                luasnip = " [LuaSnip]",
                path = " [Path]"
            })
        })
    },
    sources = {
         {name = "buffer"},
         {name = "luasnip"},
         {name = "path"}
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    }
}
