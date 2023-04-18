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
    "Shatur/neovim-tasks",
    dependencies = { "nvim-dap-ui" },
    config = function()
      local Path = require "plenary.path"
      require("tasks").setup {
        default_params = {
          -- Default module parameters with which `neovim.json` will be created.
          cmake = {
            cmd = "cmake",
            build_dir = tostring(Path:new("{cwd}", "build", "{os}-{build_type}")),
            build_type = "Debug",
            dap_name = "codelldb",
            args = {
              configure = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1", "-G", "Ninja" },
            },
          },
        },
        save_before_run = true, -- If true, all files will be saved before executing a task.
        params_file = "neovim.json", -- JSON file to store module and task parameters.
        quickfix = {
          pos = "botright", -- Default quickfix position.
          height = 12, -- Default height.
        },
        dap_open_command = false,
      }
    end,
    cmd = { "Task" },
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}
