local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    vim.notify("gitsigns not found!", vim.log.levels.WARN)
    return
end

gitsigns.setup()
