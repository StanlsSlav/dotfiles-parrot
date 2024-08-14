local wk = require("which-key")
local l = "<leader>"

wk.add({
    {
        group = "file",
        { l .. "ff", "<cmd>Telescope find_files<cr>", desc = "[f]ind" },
        { l .. "fo", "<cmd>Telescope oldfiles<cr>",   desc = "[o]ld" },
        { l .. "fr", "<cmd>Telescope registers<cr>",  desc = "[r]egisters" },
        { l .. "fg", "<cmd>Telescope live_grep<cr>",  desc = "[g]rep" },
        { l .. "fb", "<cmd>Telescope buffers<cr>",    desc = "[b]uffers" },
        { l .. "fh", "<cmd>Telescope help_tags<cr>",  desc = "[h]elp" },
        { l .. "fs", "<cmd>Telescope symbols<cr>",    desc = "[s]ymbols" },
        { l .. "fn", "<cmd>enew<cr>",                 desc = "[n]ew" },
    },

    {
        group = "mason",
        { l .. "mm", "<cmd>Mason<cr>",       desc = "[m]ason" },
        { l .. "mu", "<cmd>MasonUpdate<cr>", desc = "[u]pdate" },
        { l .. "ml", "<cmd>MasonLog<cr>",    desc = "[l]og" },
    },

    {
        group = "trouble",
        { l .. "td", "<cmd>Trouble diagnostics<cr>", desc = "[d]iagnostics" },
        { l .. "tl", "<cmd>Trouble lsp<cr>",         desc = "[l]sp" },
    },

    {
        group = "rustaceans",
        { l .. "rR", "<cmd>RustAnalyzer restart<cr>", desc = "[R]estart" },
        { l .. "rc", "<cmd>RustLsp openCargo<cr>",    desc = "open [c]argo" },
        { l .. "rd", "<cmd>RustLsp debuggables<cr>",  desc = "[d]ebuggables" }
    },

    { l .. "g", "<cmd>Git<cr>",                  desc = "[g]it" },
    { l .. "u", "<cmd>UndotreeToggle<cr>",       desc = '[u]ndotree Toggle' },
    { l .. "l", "<cmd>Lazy<cr>",                 desc = "[l]azy" },
    { l .. "e", "<cmd>Ex<cr>",                   desc = "[e]xplorer" },

    { l .. "J", desc = "append to current line" },
    { l .. "y", desc = "yank to sys clip" },
    { l .. "Y", desc = "yank line to sys clip" },

    { l .. "j", desc = "previous error" },
    { l .. "k", desc = "next error" },

    { l .. "s", desc = "find and replace carret" },
    { l .. "Z", desc = "[Z]en mode" },
})

-- Show whick-key modal after this much milliseconds
vim.opt.timeoutlen = 350
