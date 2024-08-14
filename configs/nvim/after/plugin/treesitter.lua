require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "vimdoc",
        "markdown",
        "rust",
        "bash",
        "lua",
        "python"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true }
}
