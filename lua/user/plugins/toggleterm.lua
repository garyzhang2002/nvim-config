require("toggleterm").setup {
    open_mapping = "<C-\\>",
    direction = "float",
    close_on_exit = true,
    float_opts = {
		border = "curved",
		winblend = 10,
	}
}

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local keymap = vim.api.nvim_set_keymap
local no_re_opts = {noremap = true, silent = true}

augroup("run_current_file", {clear = true})
autocmd("BufEnter", {
    group = "run_current_file",
    pattern = "*.*", -- exclude buffers for stuff like diagnostics
    callback = function ()
        local ext = vim.fn.expand("%:e")
        local file = vim.fn.expand("%:p")
        local file_wo_ext = vim.fn.expand("%:p:r")
        local file_dir = vim.fn.expand("%:p:h")
        local cmd
        if ext == "py" then
            cmd = "python3 " .. file
        elseif ext == "cpp" then
            cmd = "g++ " .. file .. " -o " .. file_wo_ext .. ".o && " .. file_wo_ext .. ".o"
        else
            keymap("n", "<Leader><F9>", "<NOP>", no_re_opts)
            return
        end
        RUN_FILE_TERM = require("toggleterm.terminal").Terminal:new {
            cmd = cmd .. " ; exit",
            dir = file_dir,
            close_on_exit = false
        }
        keymap("n", "<Leader><F9>", ":w | lua RUN_FILE_TERM:toggle()<CR>", no_re_opts)
    end
})
