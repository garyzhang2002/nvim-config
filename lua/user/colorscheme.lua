local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!", vim.log.levels.WARN)
    return
end

vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]] 
