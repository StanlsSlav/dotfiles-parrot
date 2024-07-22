local wk = require("which-key")

wk.add({
    {
        group = "+file",
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[f]ind" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>",   desc = "[r]ecent" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "[g]rep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "[b]uffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "[h]elp" },
        { "<leader>fs", "<cmd>Telescope symbols<cr>",    desc = "[s]ymbols" },
        { "<leader>fn", "<cmd>enew<cr>",                 desc = "[n]ew" },
    },
    {
        group = "+mason",
        { "<leader>mm", "<cmd>Mason<cr>",       desc = "[m]ason" },
        { "<leader>mu", "<cmd>MasonUpdate<cr>", desc = "[u]pdate" },
        { "<leader>ml", "<cmd>MasonLog<cr>",    desc = "[l]og" },
    },
    {
        group = "+trouble",
        --             t = { '<cmd>TroubleToggle<cr>', '[t]oggle' },
        --             r = { '<cmd>TroubleRefresh<cr>', '[r]efresh' },
    },

    { "<leader>g", "<cmd>Git<cr>",                  desc = "[g]it" },
    { "<leader>u", "<cmd>UndotreeToggle<cr>",       desc = '[u]ndotree Toggle' },
    { "<leader>l", "<cmd>Lazy<cr>",                 desc = "[l]azy" },
    { "<leader>e", "<cmd>Ex<cr>",                   desc = "[e]xplorer" },

    { "<leader>J", desc = "append to current line" },
    { "<leader>y", desc = "yank to sys clip" },
    { "<leader>Y", desc = "yank line to sys clip" },

    { "<leader>j", desc = "previous error" },
    { "<leader>k", desc = "next error" },

    { "<leader>s", desc = "find and replace carret" },
    { "<leader>Z", desc = "[Z]en mode" },
})

-- Show whick-key modal after this much milliseconds
vim.opt.timeoutlen = 350
