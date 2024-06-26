local dap = require "dap"
local ui = require "dapui"

require("dapui").setup()

require("nvim-dap-virtual-text").setup({
})

local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local codelldb_install_path = codelldb:get_install_path()
local codelldb_exe_path = codelldb_install_path .. "\\adapter\\codelldb.exe"

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = codelldb_exe_path,
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    detached = false,
  }
}

dap.configurations.rust = {
    {
        type = "codelldb",
        request = "launch",
        name = "exec",
        command = "rust",
        cwd = '${workspaceFolder}',
        program = function()
            local cwd = vim.fn.getcwd()
            local workspace_dir_name = cwd:gmatch("[^\\]+$")()

            return cwd .. '/target/debug/' .. workspace_dir_name .. ".exe"
        end,
        exitAfterTaskReturns = false,
        debugAutoInterpretAllModules = false
    }
}

dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end
