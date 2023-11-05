require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'vim', 'vimdoc', 'query', 'markdown' },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true }
}
