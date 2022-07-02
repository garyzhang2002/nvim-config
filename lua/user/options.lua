local options = {
    mouse = "a",
    termguicolors = true,
    cmdheight = 1,
    splitbelow = true,
    splitright = true,
    fileencoding = "utf-8",
    swapfile = false,
    autoindent = true,
    smartindent = true,
    tabstop = 4,
    softtabstop	= 4,
    shiftwidth = 4,
    expandtab = true,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    scrolloff = 8,
    sidescrolloff = 16,
    ignorecase = true,
    smartcase = true,
    completeopt = {"menuone", "noselect"},
    pumheight = 10,
    timeoutlen = 1000,
    updatetime = 500
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- win32yank.exe somehow doesn't work
if vim.fn.has("wsl") then
    vim.g.clipboard = {
        name = "clip.exe (Copy Only)",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe"
        },
        paste = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe"
        },
        cache_enabled = true
    }
end
