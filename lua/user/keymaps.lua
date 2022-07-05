local keymap = vim.api.nvim_set_keymap
no_re_opts = {noremap = true, silent = true}

-- move line(s) up or down
keymap("n", "<A-j>", ":silent! move .+1<CR>", no_re_opts) -- use silent! to avoid error messages when moving over boundaries
keymap("n", "<A-k>", ":silent! move .-2<CR>", no_re_opts)
keymap("v", "<A-j>", "<ESC>:silent! '<,'>move '>+1<CR>gv", no_re_opts)
keymap("v", "<A-k>", "<ESC>:silent! '<,'>move '<-2<CR>gv", no_re_opts)

-- stay in visual mode after indenting so that consecutive indenting is allowed
keymap("v", ">", ">gv", no_re_opts)
keymap("v", "<", "<gv", no_re_opts)
