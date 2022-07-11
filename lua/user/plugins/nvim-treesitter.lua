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
