return {
  {
    "mfussenegger/nvim-dap",
    config = function(plugin, opts)
      -- require ("plugins.configs.dap") (plugin, opts)
      local dap = require "dap"
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/lib/llvm-10/bin/lldb-vscode", -- adjust as needed, must be absolute path
        name = "lldb",
      }
      -- dap.adapters.cppdbg = {
      --   id = "cppdbg",
      --   type = "executable",
      --   request = "launch",
      --   command = "/home/user/.local/share/nvim/mason/bin/OpenDebugAD7",
      -- }
      dap.configurations.codelldb = {
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = false,
      }
      dap.configurations.lldb = {
        type = "lldb",
        request = "launch",
        runInTerminal = false,
      }
      dap.configurations.cppdbg = {
        type = "cppdbg",
        request = "launch",
        setupCommands = {
          {
            description = "Enable pretty-printing",
            text = "-enable-pretty-printing",
            ignoreFailures = false,
          },
          -- {
          --   description = "Enable break on all exceptions",
          --   text = "catch throw",
          --   ignoreFailures = true,
          -- },
        },
        stopOnEntry = true,
      }
    end,
  },
}
