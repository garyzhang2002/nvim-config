local keymap = vim.api.nvim_set_keymap
local no_re_opts = {noremap = true, silent = true}

keymap("n", "<Leader>ff", ":Telescope find_files<CR>", no_re_opts)
keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", no_re_opts)
