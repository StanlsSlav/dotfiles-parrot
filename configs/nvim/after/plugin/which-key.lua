require('which-key').register {
    ['<leader>'] = {
        f = {
            name = '+file',
            f = '[f]ind',
            r = '[re]cent',
            g = '[g]rep',
            b = '[b]uffers',
            n = { '<cmd>enew<cr>', '[n]ew' },
        },
        m = {
            name = '+mason',
            m = { '<cmd>Mason<cr>', '[m]ason' },
            u = { '<cmd>MasonUpdate<cr>', '[u]pdate' },
            l = { '<cmd>MasonLog<cr>', '[l]og' }
        },
        t = {
            name = '+trouble',
            t = { '<cmd>TroubleToggle<cr>', '[t]oggle' },
            r = { '<cmd>TroubleRefresh<cr>', '[r]efresh' },
        },
        u = { '<cmd>UndotreeToggle<cr>', '[u]ndotree Toggle' },
        l = { '<cmd>Lazy<cr>', '[l]azy' },
        e = '[e]xplorer',
        y = 'Yank to sys clip',
        Y = 'Yank line to sys clip',

        j = 'Previous error',
        k = 'Next error',

        s = "Find and replace carret"
    }
}

-- Show whick-key modal after this much milliseconds
vim.opt.timeoutlen = 350
