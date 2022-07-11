local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("BufWritePre", {
    group = augroup("trim_trailing_whitespaces", {clear = true}),
    pattern = "*",
    callback = function()
        local l = vim.fn.line(".")
        local c = vim.fn.col(".")
        vim.cmd [[%s/\s\+$//e]]
        vim.fn.cursor(l, c)
    end
})

augroup("stop_highlight_after_search", {clear = true})
autocmd("CmdlineEnter", {
    group = "stop_highlight_after_search",
    pattern = "/,?",
    command = ":set hlsearch"
})
autocmd("CmdlineLeave", {
    group = "stop_highlight_after_search",
    pattern = "/,?",
    command = ":set nohlsearch"
})

autocmd("VimLeave", {
    group = augroup("reset_cursor_style", {clear = true}),
    pattern = "*",
    command = "set guicursor=a:ver30-blinkon300"
})
