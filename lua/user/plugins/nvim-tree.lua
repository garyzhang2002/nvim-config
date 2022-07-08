require("nvim-tree").setup()

local keymap = vim.api.nvim_set_keymap
local no_re_opts = {noremap = true, silent = true}

keymap("n", "<C-b>", ":NvimTreeToggle<CR>", no_re_opts)
