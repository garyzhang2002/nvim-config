require("nvim-treesitter.configs").setup {
    ensure_installed = {"python", "c", "cpp", "lua", "java", "html", "css", "javascript", "typescript", "json", "markdown", "latex", "go", "ruby", "perl", "c_sharp", "cmake"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>"
        }
    },
    indent = {
        enable = false -- indentation based on treesitter doesn't seem to work
    }
}

-- -- enable syntax based code folding powered by Tree-sitter
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- -- automatically unfold all folds on open
-- vim.api.nvim_create_autocmd({"BufReadPost", "FileReadPost"}, {
--     group = vim.api.nvim_create_augroup("unfold_all_folds", {clear = true}),
--     pattern = "*",
--     command = "normal zR"
-- })
