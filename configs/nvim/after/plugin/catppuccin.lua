require("catppuccin").setup {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    no_italic = true,  -- Force no italic
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
    },
}

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin-mocha"
