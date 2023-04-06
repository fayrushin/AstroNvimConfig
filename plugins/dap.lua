return {
  {
    "mfussenegger/nvim-dap",
    config = function(plugin, opts)
      -- require ("plugins.configs.dap") (plugin, opts)
      local dap = require "dap"
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/lib/llvm-14/bin/lldb-vscode", -- adjust as needed, must be absolute path
        name = "lldb",
      }
    end,
  },
}
