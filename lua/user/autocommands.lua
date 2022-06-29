vim.cmd [[

    function! TrimTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfunction

    augroup trim_trailing_whitespaces
        autocmd!
        autocmd BufWritePre * :call TrimTrailingWhitespaces()
    augroup END

]]
