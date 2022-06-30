local status_ok, nvim_surround = pcall(require, "nvim-surround")
if not status_ok then
    vim.notify("nvim-surround not found!", vim.log.levels.WARN)
    return
end

require("nvim-surround").setup {
    keymaps = {
        insert = "ys",
        visual = "S",
        delete = "ds",
        change = "cs",
    }
}
