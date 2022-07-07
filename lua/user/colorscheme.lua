-- change the colorscheme here
local colorscheme = "onedarkpro"

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd "colorscheme darkblue"
    vim.cmd "highlight Normal guibg=NONE"
    return
end

local status_ok, _ = pcall(require, "user.colorschemes." .. colorscheme)
if not status_ok then
    vim.notify("Failed to set colorscheme " .. colorscheme .. "!", vim.log.levels.WARN)
    return
end
