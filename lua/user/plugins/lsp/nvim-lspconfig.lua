local keymap = vim.keymap.set

-- see `:help vim.diagnostic.*` for documentation on any of the below functions
local no_re_opts = {noremap = true, silent = true}
keymap("n", "<space>e", vim.diagnostic.open_float, no_re_opts)
keymap("n", "[d", vim.diagnostic.goto_prev, no_re_opts)
keymap("n", "]d", vim.diagnostic.goto_next, no_re_opts)
keymap("n", "<space>q", vim.diagnostic.setloclist, no_re_opts)

-- use an on_attach function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, buffer_number)
    -- see `:help vim.lsp.*` for documentation on any of the below functions
    local no_re_buf_opts = {noremap = true, silent = true, buffer = buffer_number}
    keymap("n", "gD", vim.lsp.buf.declaration, no_re_buf_opts)
    keymap("n", "gd", vim.lsp.buf.definition, no_re_buf_opts)
    keymap("n", "K", vim.lsp.buf.hover, no_re_buf_opts)
    keymap("n", "gi", vim.lsp.buf.implementation, no_re_buf_opts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, no_re_buf_opts)
    keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, no_re_buf_opts)
    keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, no_re_buf_opts)
    keymap("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, no_re_buf_opts)
    keymap("n", "<space>D", vim.lsp.buf.type_definition, no_re_buf_opts)
    keymap("n", "<space>rn", vim.lsp.buf.rename, no_re_buf_opts)
    keymap("n", "<space>ca", vim.lsp.buf.code_action, no_re_buf_opts)
    keymap("n", "gr", vim.lsp.buf.references, no_re_buf_opts)
    keymap("n", "<space>f", vim.lsp.buf.formatting, no_re_buf_opts)
end

local lsp_flags = {
    debounce_text_changes = 150,
}

require("lspconfig").pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags
}
require("lspconfig").sumneko_lua.setup {
    on_attach = on_attach,
    flags = lsp_flags
}
require("lspconfig").clangd.setup {
    on_attach = on_attach,
    flags = lsp_flags
}