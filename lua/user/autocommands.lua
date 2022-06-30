vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        local l = vim.fn.line(".")
        local c = vim.fn.col(".")
        vim.cmd [[%s/\s\+$//e]]
        vim.fn.cursor(l, c)
    end
})
