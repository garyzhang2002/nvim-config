local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    print("Colorscheme " .. colorscheme .. " not found! Using default instead.")
    return
end

vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]] 
