local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    print("gitsigns not found!")
    return
end

gitsigns.setup()
