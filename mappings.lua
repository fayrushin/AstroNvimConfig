-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- Fast moving to word
    ["<leader>["] = {
      "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>",
      desc = "Hop before cursor",
    },
    ["<leader>]"] = {
      "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>",
      desc = "Hop after cursor",
    },
    -- Trouble diagnostics
    ["<leader>a"] = { name = "Diagnostics" },
    ["<leader>ar"] = { "<cmd>Trouble lsp_references<cr>", desc = "references" },
    ["<leader>at"] = { "<cmd>TroubleToggle<cr>", desc = "trouble" },
    ["<leader>ad"] = { "<cmd>Trouble document_diagnostics<cr>", desc = "document" },
    ["<leader>aw"] = { "<cmd>Trouble workspace_diagnostics<cr>", desc = "workspace" },
    -- ["<leader>ar"] = { "<cmd>lua vim.lsp.buf.references()<cr>", desc = "references" },
    -- ["<leader>ad"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "document" },
    -- Diffview
    ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "View git diff" },
    ["<leader>gq"] = { "<cmd>DiffviewClose<cr>", desc = "Close git diff" },
    ["<leader>gh"] = { "<cmd>DiffviewFileHistory<cr>", desc = "View file history" },
    ["<leader>gf"] = { "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle files bar" },
    ["<leader>gr"] = { "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset git hunk" },
    ["<leader>gR"] = { "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset git buffer" },
    ["<leader>gj"] = { "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
    ["<leader>gk"] = { "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
    -- CMake
    ["<leader>m"] = { name = "CMake" },
    ["<leader>mp"] = { "<cmd>Task set_task_param cmake configure args<cr>", desc = "Set CMake configuration" },
    ["<leader>mc"] = { "<cmd>Task start cmake configure<cr>", desc = "CMake configure" },
    ["<leader>ms"] = { "<cmd>Task set_module_param cmake target<cr>", desc = "CMake select target" },
    ["<leader>mt"] = { "<cmd>Task set_module_param cmake build_type<cr>", desc = "CMake select build type" },
    ["<leader>ma"] = { "<cmd>Task set_task_param cmake run args<cr>", desc = "Set run args" },
    ["<leader>mr"] = { "<cmd>Task start cmake run<cr>", desc = "CMake run" },
    ["<leader>mb"] = { "<cmd>Task start cmake build<cr>", desc = "CMake build" },
    ["<leader>md"] = { "<cmd>Task start cmake debug<cr>", desc = "CMake debug" },
    ["<leader>me"] = { "<cmd>Task start cmake clean<cr>", desc = "CMake clean" },
    ["<leader>mq"] = { "<cmd>Task cancel<cr>", desc = "CMake cancel" },
    -- Switch header/source
    ["<leader>lt"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Toggle source/header" },
    -- move line up/down
    ["<A-k>"] = { "<cmd>m .-2<CR>", desc = "move line up" },
    ["<A-j>"] = { "<cmd>m .+1<CR>", desc = "move line down" },
  },
  v = {
    -- move line up/down
    ["<A-j>"] = { ":m '>+1<cr>gv=gv" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
