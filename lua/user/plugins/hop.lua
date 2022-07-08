require("hop").setup()

local keymap = vim.api.nvim_set_keymap
local no_re_opts = {noremap = true, silent = true}

keymap("", "<Leader>h", ":HopWord<CR>", no_re_opts)
