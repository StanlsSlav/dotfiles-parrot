require('lualine').setup {
    sections = {
        lualine_c = { 'filename', 'lsp_progress' },
        lualine_x = { 'encoding', 'fileformat', 'filetype', 'tabnine' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {},
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}
