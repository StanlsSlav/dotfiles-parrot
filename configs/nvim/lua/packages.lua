local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Visuals
    { 'catppuccin/nvim', name = 'catppuccin' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', opt = true }
        }
    },

    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Prettier undo history and permanent
    { 'mbbill/undotree' },

    -- Highlight, edit, and navigate code
    { 'nvim-treesitter/nvim-treesitter' },

    -- Git related
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },

    -- :)
    { 'codota/tabnine-nvim', build = './dl_binaries.sh' },

    -- LSP related
    {
        'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
        dependencies = {
            -- LSP Support
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },

            -- Snippet Engine
            { 'L3MON4D3/LuaSnip', version = 'v2.*' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' }
        }
    },

    -- Listing of errors and more
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Commenting
    { 'numToStr/Comment.nvim' },

    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Make NeoVim experience easier
    { 'folke/which-key.nvim', event = 'VeryLazy' },
    { 'folke/zen-mode.nvim' },
    { 'folke/neodev.nvim' }
})
