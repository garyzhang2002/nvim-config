-- change the colorscheme here
local colorscheme = "onedark"
local bg = "NONE"

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd "colorscheme darkblue"
    vim.cmd "highlight Normal guibg=NONE"
    return
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not found! Using default instead.", vim.log.levels.WARN)
    return
end

vim.cmd("highlight Normal guibg=" .. bg)
