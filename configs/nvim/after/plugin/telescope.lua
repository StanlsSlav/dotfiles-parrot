local ts = require("telescope")

ts.setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown()
        }
    }
})

ts.load_extension('ui-select')
ts.load_extension("conventional_commits")
