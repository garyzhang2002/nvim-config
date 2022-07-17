require("toggleterm").setup {
    open_mapping = "<C-\\>",
    direction = "float",
    close_on_exit = false,
    float_opts = {
		border = "curved",
		winblend = 10,
	}
}

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local keymap = vim.api.nvim_set_keymap
local no_re_opts = {noremap = true, silent = true}

local cmd_prefix = ":w | ToggleTerm dir=%:p:h<CR>"
local cmd_suffix = " ; exit<CR>"
augroup("run_current_file", {clear = true})
autocmd("BufEnter", {
    group = "run_current_file",
    pattern = "*",
    callback = function ()
        local file = vim.fn.expand("%:p")
        local ext = vim.fn.expand("%:e")
        local file_wo_ext = vim.fn.expand("%:p:r")
        if ext == "py" then
            keymap("n", "<Leader><F9>", cmd_prefix .. "python3 " .. file .. cmd_suffix, no_re_opts)
        elseif ext == "cpp" then
            keymap("n", "<Leader><F9>", cmd_prefix .. "g++ " .. file .. " -o " .. file_wo_ext .. ".o && " .. file_wo_ext .. ".o" .. cmd_suffix, no_re_opts)
        else
            keymap("n", "<Leader><F9>", "<NOP>", no_re_opts)
        end
    end
})
