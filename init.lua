--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

  -- Set colorscheme to use
  colorscheme = "nightfox",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      clipboard = "",
      relativenumber = false, -- sets vim.opt.relativenumber
      smartindent = true,
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autopairs_enabled = false, -- enable autopairs at start
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
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
  lsp = {
    servers = {
      -- "clangd",
      -- "pyright"
    },
    formatting = {
      format_on_save = false, -- enable or disable auto formatting on save
      disabled = { -- disable formatting capabilities for the listed clients
        -- "sumneko_lua",
      },
      timeout_ms = 3000,
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
  },

  icons = {
    VimIcon = "",
  },
  heirline = {
    -- define the separators between each section
    separators = {
      left = { "", " " }, -- separator for the left side of the statusline
      right = { " ", "" }, -- separator for the right side of the statusline
    },
    -- add new colors that can be used by heirline
    colors = {
      blank_bg = "#5c6370",
      file_info_bg = "#a3589c",
      nav_icon_bg = "#89b06d",
      folder_icon_bg = "#ec5f67",
    },
  },
  dap = {
    adapters = {
      lldb = {
        type = "executable",
        command = "/usr/lib/llvm-10/bin/lldb-vscode", -- adjust as needed, must be absolute path
        name = "lldb",
      },
    },
  },
  -- Configure plugins
  plugins = {
    init = {
      ["Darazaki/indent-o-matic"] = {
        disable = true,
      },
      {
        "nmac427/guess-indent.nvim",
        config = function() require("guess-indent").setup {} end,
      },
      {
        "EdenEast/nightfox.nvim",
      },
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
              sh = "/bin/bash",
            },
          }
        end,
      },
      {
        "sindrets/diffview.nvim",
        -- requires = "nvim-lua/plenary.nvim",
        -- config = function()
        --   require("diffview").setup {
        --     keymaps = {
        --       view = {
        --         ["<leader>e"] = false,
        --         ["<leader>b"] = false,
        --       },
        --       file_panel = {
        --         ["<leader>e"] = false,
        --         ["<leader>b"] = false,
        --       },
        --       file_history_panel = {
        --         ["<leader>e"] = false,
        --         ["<leader>b"] = false,
        --       },
        --     },
        --   }
        -- end,
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
            dap_configurations = {
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
            dap_configuration = "lldb_vscode",
            dap_open_command = false,
          }
        end,
      },
    },

    heirline = function(config)
      -- the first element of the configuration table is the statusline
      config[1] = {
        -- default highlight for the entire statusline
        hl = { fg = "fg", bg = "bg" },
        -- each element following is a component in astronvim.status module

        -- add the vim mode component
        astronvim.status.component.mode {
          -- enable mode text with padding as well as an icon before it
          mode_text = {
            icon = {
              kind = "VimIcon",
              padding = { right = 1, left = 1 },
            },
          },
          -- define the highlight color for the text
          hl = { fg = "bg" },
          -- surround the component with a separators
          surround = {
            -- it's a left element, so use the left separator
            separator = "left",
            -- set the color of the surrounding based on the current mode using astronvim.status module
            color = function()
              return {
                main = astronvim.status.hl.mode_bg(),
                right = "blank_bg",
              }
            end,
          },
        },
        -- we want an empty space here so we can use the component builder to make a new section with just an empty string
        astronvim.status.component.builder {
          { provider = "" },
          -- define the surrounding separator and colors to be used inside of the component
          -- and the color to the right of the separated out section
          surround = {
            separator = "left",
            color = { main = "blank_bg", right = "file_info_bg" },
          },
        },
        -- add a section for the currently opened file information
        astronvim.status.component.file_info {
          -- enable the file_icon and disable the highlighting based on filetype
          file_icon = { highlight = false, padding = { left = 0 } },
          -- add padding
          padding = { right = 1 },
          -- define the section separator
          surround = { separator = "left", condition = false },
        },
        -- add a component for the current git branch if it exists and use no separator for the sections
        astronvim.status.component.git_branch { surround = { separator = "none" } },
        -- add a component for the current git diff if it exists and use no separator for the sections
        astronvim.status.component.git_diff {
          padding = { left = 1 },
          surround = { separator = "none" },
        },
        -- fill the rest of the statusline
        -- the elements after this will appear in the middle of the statusline
        astronvim.status.component.fill(),
        -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
        astronvim.status.component.lsp {
          lsp_client_names = false,
          surround = { separator = "none", color = "bg" },
        },
        -- fill the rest of the statusline
        -- the elements after this will appear on the right of the statusline
        astronvim.status.component.fill(),
        -- add a component for the current diagnostics if it exists and use the right separator for the section
        astronvim.status.component.diagnostics { surround = { separator = "right" } },
        -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
        astronvim.status.component.lsp {
          lsp_progress = false,
          surround = { separator = "right" },
        },
        astronvim.status.component.cmd_info { search_count = { maxcount = 999 } },
        -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
        -- all of the children of this table will be treated together as a single component
        {
          -- define a simple component where the provider is just a folder icon
          astronvim.status.component.builder {
            -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
            { provider = astronvim.get_icon "FolderClosed" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the foreground color to be used for the icon
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            surround = { separator = "right", color = "folder_icon_bg" },
          },
          -- add a file information component and only show the current working directory name
          astronvim.status.component.file_info {
            -- we only want filename to be used and we can change the fname
            -- function to get the current working directory name
            filename = {
              fname = function() return vim.fn.getcwd() end,
              padding = { left = 1 },
            },
            -- disable all other elements of the file_info component
            file_icon = false,
            file_modified = false,
            file_read_only = false,
            -- use no separator for this part but define a background color
            surround = { separator = "none", color = "file_info_bg" },
          },
        },
        -- the final component of the NvChad statusline is the navigation section
        -- this is very similar to the previous current working directory section with the icon
        { -- make nav section with icon border
          -- define a custom component with just a file icon
          astronvim.status.component.builder {
            { provider = astronvim.get_icon "DefaultFile" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the icon foreground
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            -- as well as the color to the left of the separator
            surround = {
              separator = "right",
              color = { main = "nav_icon_bg", left = "file_info_bg" },
            },
          },
          -- add a navigation component and just display the percentage of progress in the file
          astronvim.status.component.nav {
            -- add some padding for the percentage provider
            percentage = { padding = { left = 1, right = 1 } },
            -- disable all other providers
            ruler = false,
            scrollbar = false,
            -- define the foreground color
            hl = { fg = "nav_icon_bg" },
            -- use no separator and define the background color
            surround = { separator = "none", color = "file_info_bg" },
          },
        },
      }

      -- a second element in the heirline setup would override the winbar
      -- by only providing a single element we will only override the statusline
      -- and use the default winbar in AstroNvim

      -- return the final confiuration table
      return config
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      ensure_installed = {
        "lua",
        "cpp",
        "python",
        "cmake",
        "rust",
        "bash",
        "c",
        "json",
        "markdown",
        "dockerfile",
        "yaml",
      },
    },
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = { "clangd", "marksman", "sumneko_lua", "pyright", "cmake", "jsonls", "bashls" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      ensure_installed = { "black", "prettier", "shfmt", "shellcheck", "cmakelang" },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false,
    underline = false,
  },

  mappings = {
    -- first key is the mode
    n = {
      ["<leader>d"] = false,
      ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "View git diff" },
      ["<leader>gq"] = { "<cmd>DiffviewClose<cr>", desc = "Close git diff" },
      ["<leader>gh"] = { "<cmd>DiffviewFileHistory<cr>", desc = "View file history" },
      ["<leader>gf"] = { "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle files bar" },
      ["<leader>gr"] = { "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset git hunk" },
      ["<leader>gR"] = { "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset git buffer" },
      ["<A-k>"] = { "<cmd>m .-2<CR>", desc = "move line up" },
      ["<A-j>"] = { "<cmd>m .+1<CR>", desc = "move line down" },
      ["<leader>lt"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Toggle source/header" },
    },
    v = {
      ["<A-j>"] = { ":m '>+1<cr>gv=gv" },
      ["<A-k>"] = { ":m '<-2<cr>gv=gv" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    local opts = { expr = true, noremap = true }
    local map = vim.keymap.set
    map("c", "<c-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', opts)
    map("c", "<c-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', opts)
  end,
}

return config
