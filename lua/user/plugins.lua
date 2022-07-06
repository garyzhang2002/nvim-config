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
    use {"nvim-treesitter/nvim-treesitter", run = ":silent! TSUpdate", config = function() require "user.plugins.nvim-treesitter" end}
    -- completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            {
                "saadparwaiz1/cmp_luasnip",
                requires = {
                    "L3MON4D3/LuaSnip",
                    "rafamadriz/friendly-snippets"
                }
            },
            "onsails/lspkind.nvim"
        },
        config = function() require "user.plugins.nvim-cmp" end
    }
    -- GitHub Copilot
    use {"github/copilot.vim", config = function() require "user.plugins.copilot" end}
    -- WakaTime
    use "wakatime/vim-wakatime"
    -- file explorer tree
    use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", config = function() require "user.plugins.nvim-tree" end}
    -- git
    use {"lewis6991/gitsigns.nvim", config = function() require "user.plugins.gitsigns" end}
    -- commenting
    use {"terrortylor/nvim-comment", config = function() require "user.plugins.nvim-comment" end}
    -- surround
    use {"kylechui/nvim-surround", config = function() require "user.plugins.nvim-surround" end}
    ----------------------------------------------------

    -- automatically set up the configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

end)
