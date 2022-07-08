local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {"sumneko_lua", "pyright", "clangd"}
for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup {
        capabilities = capabilities,
    }
end

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
    completion = {
        completeopt = "menu,preview"
    },
    mapping = {
        ["<C-y>"] = cmp.mapping.complete(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-f>"] = cmp.mapping.scroll_docs(2),
        ["<C-b>"] = cmp.mapping.scroll_docs(-2),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.confirm {select = true}
                elseif luasnip.expand_or_jumpable() then
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
                nvim_lsp = " [LSP]",
                buffer = " [Buffer]",
                luasnip = " [LuaSnip]",
                path = " [Path]"
            })
        })
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "buffer"},
        {name = "luasnip"},
        {name = "path"}
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    }
}
