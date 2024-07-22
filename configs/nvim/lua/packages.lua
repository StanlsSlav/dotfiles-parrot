local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Visuals
    { "catppuccin/nvim", name = "catppuccin" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", opt = true }
        }
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim", "olacin/telescope-cc.nvim" }
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Prettier undo history and permanent
    { "mbbill/undotree" },

    -- Highlight, edit, and navigate code
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Git related
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },

    -- :)
    { "supermaven-inc/supermaven-nvim" },

    -- LSP related
    {
        "VonHeikemen/lsp-zero.nvim", branch = "v3.x",
        dependencies = {
            -- LSP Support
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },

            -- Snippet Engine
            { "L3MON4D3/LuaSnip", version = "v2.*" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" }
        }
    },

    { 'mrcjkb/rustaceanvim', version = '^4' },

    -- Listing of errors and more
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- DAP
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    },
    { "theHamsta/nvim-dap-virtual-text" },

    -- Commenting
    { "numToStr/Comment.nvim" },

    -- Make Neovim experience easier
    { "folke/which-key.nvim", event = "VeryLazy" },
    { "folke/zen-mode.nvim" },
    { "folke/lazydev.nvim" }
})
