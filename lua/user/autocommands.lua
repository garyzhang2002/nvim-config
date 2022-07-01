vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("trim_trailing_whitespaces", {clear = true}),
    pattern = "*",
    callback = function()
        local l = vim.fn.line(".")
        local c = vim.fn.col(".")
        vim.cmd [[%s/\s\+$//e]]
        vim.fn.cursor(l, c)
    end
})

vim.api.nvim_create_augroup("stop_highlight_after_search", {clear = true})
vim.api.nvim_create_autocmd("CmdlineEnter", {
    group = "stop_highlight_after_search",
    pattern = "/,?",
    command = ":set hlsearch"
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
    group = "stop_highlight_after_search",
    pattern = "/,?",
    command = ":set nohlsearch"
})
