local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    print "Installing packer..."
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Finished."
    print "Please reload Neovim after the plugins are installed."
    print "Now press ENTER and wait for packer to install the plugins."
    vim.cmd [[packadd packer.nvim]]
end

-- automatically source this file and PackerSync on save
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("source_plugins_and_packersync", {clear = true}),
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync"
})

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end
    }
}

-- install plugins
return packer.startup(function(use)

    use "wbthomason/packer.nvim" -- have packer manage itself
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    -------------------- my plugins --------------------
    -- colorschemes
    use "joshdick/onedark.vim"
    use "folke/tokyonight.nvim"
    -- Tree-sitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = function() require("user.nvim-treesitter") end}
    -- GitHub Copilot
    use {"github/copilot.vim", config = function() require("user.copilot") end}
    -- WakaTime
    use "wakatime/vim-wakatime"
    -- git
    use {"lewis6991/gitsigns.nvim", config = function() require("user.gitsigns") end}
    -- commenting
    use {"terrortylor/nvim-comment", config = function() require("user.nvim-comment") end}
    -- surround
    use {"kylechui/nvim-surround", config = function() require("user.nvim-surround") end}
    ----------------------------------------------------

    -- automatically set up the configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

end)
