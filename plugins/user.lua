return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  {
    "phaazon/hop.nvim",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
    event = "User AstroFile",
  },

  {
    "sindrets/diffview.nvim",
    event = "User AstroFile",
    cmd = "DiffviewOpen",
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "telescope.nvim" },
    config = function() require("telescope").load_extension "ui-select" end,
  },
  {
    "Shatur/neovim-cmake",
    dependencies = { "nvim-dap-ui" },
    config = function()
      require("cmake").setup {
        cmake_executable = "cmake",
        save_before_build = true,
        parameters_file = "neovim.json",
        configure_args = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
        build_args = { "-j 8" },
        quickfix = {
          pos = "botright",      -- Where to open quickfix
          height = 10,           -- Height of the opened quickfix.
          only_on_error = false, -- Open quickfix window only if target build failed.
        },
        dap_configurations = {
          codelldb_vscode = {
            type = "codelldb",
            request = "launch",
            stopOnEntry = false,
            runInTerminal = false,
          },
          lldb_vscode = {
            type = "lldb",
            request = "launch",
            runInTerminal = false,
          },
          cppdbg_vscode = {
            type = "cppdbg",
            request = "launch",
            setupCommands = {
              {
                description = "Enable pretty-printing",
                text = "-enable-pretty-printing",
                ignoreFailures = false,
              },
            },
            stopOnEntry = true,
          },
        },
        -- dap_configuration = "lldb_vscode",
        -- dap_configuration = "cppdbg_vscode",
        dap_configuration = "codelldb_vscode",
        dap_open_command = false,
      }
    end,
    cmd = { "CMake" },
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}
