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

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- automatically source this file and PackerSync on save
autocmd("BufWritePost", {
    group = augroup("source_plugins_and_packersync", {clear = true}),
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
            return require("packer.util").float {border = "rounded"}
        end
    }
}

-- install plugins
return packer.startup(function(use)

    use {"wbthomason/packer.nvim", commit = "494fd5999b19e29992eb0978c4fa8988d2023ad8"} -- have packer manage itself
    use {"nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac"}
    use {"nvim-lua/plenary.nvim", commit = "986ad71ae930c7d96e812734540511b4ca838aa2"}

    -------------------- my plugins --------------------
    -- colorschemes
    use {"navarasu/onedark.nvim", commit = "a5d57015fe164e1a65f317116089956e395132d3"}
    use {"folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb"}
    -- Tree-sitter
    use {"nvim-treesitter/nvim-treesitter", commit = "acd4821bc1a737230ef4d6eb52f03b5fe21da3df", run = ":silent! TSUpdate", config = "require 'user.plugins.nvim-treesitter'"}
    -- completion & lsp
    use {
        "hrsh7th/nvim-cmp",
        commit = "9897465a7663997b7b42372164ffc3635321a2fe",
        requires = {
            {"onsails/lspkind.nvim", commit = "57e5b5dfbe991151b07d272a06e365a77cc3d0e7"},
            {"hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323"},
            {"hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921"},
            {
                "saadparwaiz1/cmp_luasnip",
                commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
                requires = {
                    {"L3MON4D3/LuaSnip", commit = "45fc3d860cfa7a074b4d2fbf68c0249aa3a01320"},
                    {"rafamadriz/friendly-snippets", commit = "0e516c9d9892d6bf268492136971d315dd704d16"}
                }
            },
            {
                "hrsh7th/cmp-nvim-lsp",
                commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
                requires = {
                    {"williamboman/nvim-lsp-installer", commit = "793f99660fa9212f52ee8b6164454e03ba1f42c9"},
                    {"neovim/nvim-lspconfig", commit = "575d1f8bcdff90aaa663ad74275feb9972fa1e69"}
                },
                config = "require 'user.plugins.lsp'"
            },
        },
        config = "require 'user.plugins.nvim-cmp'"
    }
    -- GitHub Copilot
    use {"github/copilot.vim", commit = "c2e75a3a7519c126c6fdb35984976df9ae13f564", config = "require 'user.plugins.copilot'"}
    -- WakaTime
    use {"wakatime/vim-wakatime", commit = "4692ec3e77ade9e65171182296cca74352a39a12"}
    -- file explorer tree
    use {"kyazdani42/nvim-tree.lua", commit = "06e48c29c4543331eee41753e69e3bd2235bf430", requires = "kyazdani42/nvim-web-devicons", config = "require 'user.plugins.nvim-tree'"}
    -- status line
    use {"nvim-lualine/lualine.nvim", commit = "655411fb7aa3cf4d46094132d684d815453f5043", requires = "kyazdani42/nvim-web-devicons", config = "require 'user.plugins.lualine'"}
    -- buffer line
    use {"akinsho/bufferline.nvim", commit = "d7b775a35be9c80ed591d3335b35ec84e5c5d81e", requires = "kyazdani42/nvim-web-devicons", config = "require 'user.plugins.bufferline'"}
    -- git
    use {"lewis6991/gitsigns.nvim", commit = "bb6c3bf6f584e73945a0913bb3adf77b60d6f6a2", config = "require 'user.plugins.gitsigns'"}
    -- commenting
    use {"numToStr/Comment.nvim", commit = "761f63f52f6ab5dcad7933a73c18dae5ab6d3197", config = "require 'user.plugins.comment'"}
    -- surround
    use {"kylechui/nvim-surround", commit = "2200f7275e19aea608f33872680e25ee687cfcb3", config = "require 'user.plugins.nvim-surround'"}
    -- motion
    use {"phaazon/hop.nvim", commit = "6bcaeb7c0ea30afe137db11fcf681c373a7171bf", config = "require 'user.plugins.hop'"}
    -- fuzzy finder
    use {"nvim-telescope/telescope.nvim", commit = "6bddc38c25af7b50f99cb0c035248d7272971810", config = "require 'user.plugins.telescope'"}
    -- terminal
    use {"akinsho/toggleterm.nvim", commit = "3f9d383f1f89eb5a1558ee612061eccaca385680", config = "require 'user.plugins.toggleterm'"}
    ----------------------------------------------------

    -- automatically set up the configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

end)
