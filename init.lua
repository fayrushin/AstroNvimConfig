local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = true, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme
  colorscheme = "vscode",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      clipboard = "",
      relativenumber = false, -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      vscode_style = "dark",
      vscode_italic_comment = 1,
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
          ["d"] = {
            name = "Debug",
            ["t"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
            ["b"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
            ["c"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
            ["C"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
            ["d"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
            ["g"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
            ["i"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
            ["o"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
            ["u"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
            ["p"] = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
            ["r"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
            ["s"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
            ["q"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
            ["x"] = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle debug UI" },
          },
          ["r"] = { "<cmd>RunCode<cr>", "Run code" },
          ["b"] = {
            name = "CMake",
            ["n"] = { "<cmd>CMake create_project<cr>", "Create new project" },
            ["c"] = { "<cmd>CMake configure<cr>", "CMake configure" },
            ["s"] = { "<cmd>CMake select_target<cr>", "CMake select target" },
            ["r"] = { "<cmd>CMake build_and_run<cr>", "CMake run" },
            ["t"] = { "<cmd>CMake select_build_type<cr>", "CMake select build type" },
            ["b"] = { "<cmd>CMake build<cr>", "CMake build" },
            ["d"] = { "<cmd>CMake build_and_debug<cr>", "CMake debug" },
            ["e"] = { "<cmd>CMake clean<cr>", "CMake clean" },
            ["q"] = { "<cmd>CMake cancel<cr>", "CMake cancel" },
          },
          ["n"] = {
            name = "Hop",
            ["n"] = { "<cmd> HopChar1 <cr>", "Hop one char" },
            ["h"] = {
              "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>",
              "Hop before cursor",
            },
            ["l"] = {
              "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>",
              "Hop after cursor",
            },
            ["j"] = {
              "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
              "Hop line before cursor",
            },
            ["k"] = {
              "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
              "Hop line after cursor",
            },
          },
          ["a"] = {
            name = "Diagnostics",
            t = { "<cmd>TroubleToggle<cr>", "trouble" },
            w = { "<cmd>Trouble workspace_diagnostics<cr>", "workspace" },
            d = { "<cmd>Trouble document_diagnostics<cr>", "document" },
            q = { "<cmd>Trouble quickfix<cr>", "quickfix" },
            l = { "<cmd>Trouble loclist<cr>", "loclist" },
            r = { "<cmd>Trouble lsp_references<cr>", "references" },
          },
        },
      },
    },
  },
  -- lsp = {
  --   servers = {
  --     "pyright",
  --   },
  --   ["server-settings"] = {
  --     pyright = {
  --       {
  --         analysis = {
  --           autoSearchPaths = true,
  --           diagnosticMode = "openFilesOnly",
  --           useLibraryCodeForTypes = true,
  --           typeCheckingMode = "basic",
  --         },
  --       },
  --     },
  --   },
  -- },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- {
      --   "tanvirtin/vgit.nvim",
      --   requires = {
      --     "nvim-lua/plenary.nvim",
      --   },
      --   config = function() require("vgit").setup() end,
      -- },
      -- { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
      {
        "CRAG666/code_runner.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("code_runner").setup {
            filetype = {
              java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
              python = "python3 -u",
              typescript = "deno run",
              rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
            },
          }
        end,
      },
      {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
      },
      {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
      },
      {
        "phaazon/hop.nvim",
        config = function()
          -- you can configure Hop the way you like here; see :h hop-config
          require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
        end,
      },

      {
        "nvim-telescope/telescope-ui-select.nvim",
        after = "telescope.nvim",
        config = function() require("telescope").load_extension "ui-select" end,
      },
      {
        "fayrushin/vscode.nvim",
      },
      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function() require("catppuccin").setup {} end,
      },
      {
        "mfussenegger/nvim-dap",
        config = function()
          local dap = require "dap"
          dap.adapters = {
            python = {
              type = "executable",
              command = "/usr/bin/python3",
              args = { "-m", "debugpy.adapter" },
            },
            cppdbg = {
              id = "cppdbg",
              type = "executable",
              name = "cppdbg",
              command = "OpenDebugAD7",
            },
            lldb = {
              type = "executable",
              command = "/usr/lib/llvm-14/bin/lldb-vscode", -- adjust as needed, must be absolute path
              name = "lldb",
            },
          }
          dap.configurations = {
            python = {
              {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function() return "/usr/bin/python3" end,
              },
            },
            cpp = {
              {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function() return vim.fn.input("Path to executable: ", vim.fn.expand "%:p" .. "/", "file") end,
                cwd = "${workspaceFolder}",
                stopOnEntry = true,
                setupCommands = {
                  {
                    description = "Enable pretty-printing",
                    text = "-enable-pretty-printing",
                    ignoreFailures = false,
                  },
                },
                runInTerminal = true,
              },
            },
          }
          -- get notify
          local function start_session(_, _)
            local info_string = string.format("%s", dap.session().config.program)
            vim.notify(info_string, "debug", { title = "Debugger Started", timeout = 500 })
          end

          local function terminate_session(_, _)
            local info_string = string.format("%s", dap.session().config.program)
            vim.notify(info_string, "debug", { title = "Debugger Terminated", timeout = 500 })
          end

          dap.listeners.after.event_initialized["dapui"] = start_session
          dap.listeners.before.event_terminated["dapui"] = terminate_session
          -- Define symbols
          vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
          vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
          vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
          vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
          vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
        end,
      },
      {
        "rcarriga/nvim-dap-ui",
        after = "nvim-dap",
        config = function()
          -- require("dapui").setup()
          local dap, dapui = require "dap", require "dapui"
          dapui.setup {
            icons = { expanded = "▾", collapsed = "▸" },
            mappings = {
              expand = "<cr>",
              open = "o",
              remove = "d",
              edit = "e",
              repl = "r",
              toggle = "t",
            },
            layouts = {
              {
                elements = {
                  { id = "watches", size = 0.5 },
                  { id = "scopes", size = 0.5 },
                  { id = "breakpoints", size = 0.25 },
                  { id = "stacks", size = 0.25 },
                },
                size = 40,
                position = "left",
              },
              {
                elements = { "repl" },
                size = 10,
                position = "bottom",
              },
            },
            floating = {
              border = "single",
              mappings = {
                close = { "q", "<esc>" },
              },
            },
            windows = { indent = 1 },
          }
          -- add listeners to auto open DAP UI
          dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
          -- dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
          -- dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        after = "nvim-dap",
        config = function() require("nvim-dap-virtual-text").setup() end,
      },
      {
        "Shatur/neovim-cmake",
        after = "nvim-dap-ui",
        -- commit = "536987ef1fcbe7209ca3f243495603a5f1c250a7",
        config = function()
          require("cmake").setup {
            cmake_executable = "cmake",
            save_before_build = true,
            parameters_file = "neovim.json",
            configure_args = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
            build_args = { "-j 8" },
            quickfix = {
              pos = "botright", -- Where to open quickfix
              height = 10, -- Height of the opened quickfix.
              only_on_error = false, -- Open quickfix window only if target build failed.
            },
            dap_configuration = {
              type = "lldb",
              request = "launch",
              -- setupCommands = {
              --   {
              --     description = "Enable pretty-printing",
              --     text = "-enable-pretty-printing",
              --     ignoreFailures = false
              --   }
              -- },
              runInTerminal = false,
              stopOnEntry = false,
              -- args = { "-h" },
            },
            dap_open_command = false,
            -- dap_open_command = require('dap').repl.open,
            -- dap_open_command = require('dapui').open,
          }
        end,
      },
    },
    treesitter = {
      ensure_installed = { "lua", "cpp", "python", "cmake", "rust", "bash", "c", "json" },
    },
    ["mason-lspconfig"] = {
      ensure_installed = { "marksman", "sumneko_lua", "clangd", "pyright", "cmake", "jsonls" },
    },
    ["mason-tool-installer"] = {
      ensure_installed = { "stylua", "black", "jq", "prettier" },
    },
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.jq,
        null_ls.builtins.formatting.prettier,
        -- Set a linter
        -- null_ls.builtins.diagnostics.flake8,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  mappings = {
    -- first key is the mode
    n = {
      -- setting a mapping to false will disable it
      ["<leader>d"] = false,
    },
  },

  polish = function()
    local map = vim.keymap.set
    local unmap = vim.keymap.del

    unmap("t", "<esc>")
    unmap("t", "jk")

    map("t", "<c-q>", "<c-\\><c-n>", { desc = "Terminal normal mode" })
    -- map("t", "<esc><esc>", "<c-\\><c-n>:q<cr>", { desc = "Terminal quit" })
  end,
}

return config
