vim.g.copilot_filetypes = {
    ["*"] = true,
    json = false
}

vim.cmd [[highlight CopilotSuggestion guifg=#808080]]

vim.cmd [[imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")]]

vim.g.copilot_assume_mapped = true
