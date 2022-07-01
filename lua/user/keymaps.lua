local keymap = vim.api.nvim_set_keymap
no_re_opts = {noremap = true, silent = true}

-- move line(s) up or down
keymap("n", "<A-j>", [[:lua pcall(vim.cmd, "move .+1")<CR>]], no_re_opts) -- use pcall to avoid error when moving over boundaries
keymap("n", "<A-k>", [[:lua pcall(vim.cmd, "move .-2")<CR>]], no_re_opts)
keymap("v", "<A-j>", [[:lua pcall(vim.cmd, "'<,'>move '>+1")<CR>gv]], no_re_opts)
keymap("v", "<A-k>", [[:lua pcall(vim.cmd, "'<,'>move '<-2")<CR>gv]], no_re_opts)
-- the version below re-indents the line(s) after moving them
-- keymap("n", "<A-j>", [[:lua pcall(vim.cmd, "move .+1")<CR>==]], no_re_opt)
-- keymap("n", "<A-k>", [[:lua pcall(vim.cmd, "move .-2")<CR>==]], no_re_opt)
-- keymap("v", "<A-j>", [[:lua pcall(vim.cmd, "'<,'>move '>+1")<CR>gv=gv]], no_re_opt)
-- keymap("v", "<A-k>", [[:lua pcall(vim.cmd, "'<,'>move '<-2")<CR>gv=gv]], no_re_opt)

-- stay in visual mode after indenting so that consecutive indenting is allowed
keymap("v", ">", ">gv", no_re_opts)
keymap("v", "<", "<gv", no_re_opts)
