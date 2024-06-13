require('which-key').register {
    ['<leader>'] = {
        f = {
            name = '+file',
            f = { '<cmd>Telescope find_files<cr>', '[f]ind' },
            r = { '<cmd>Telescope oldfiles<cr>', '[r]ecent' },
            g = { '<cmd>Telescope live_grep<cr>', '[g]rep' },
            b = { '<cmd>Telescope buffers<cr>', '[b]uffers' },
            h = { '<cmd>Telescope help_tags<cr>', '[h]elp' },
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
        g = { '<cmd>Git<cr>', '[g]it' },
        u = { '<cmd>UndotreeToggle<cr>', '[u]ndotree Toggle' },
        l = { '<cmd>Lazy<cr>', '[l]azy' },
        e = { '<cmd>Ex<cr>', '[e]xplorer' },

        J = 'append to current line',
        y = 'yank to sys clip',
        Y = 'yank line to sys clip',

        j = 'previous error',
        k = 'next error',

        s = "find and replace carret"
    }
}

-- Show whick-key modal after this much milliseconds
vim.opt.timeoutlen = 350
