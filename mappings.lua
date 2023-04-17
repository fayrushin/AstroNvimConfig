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
    ["<leader>mn"] = { "<cmd>CMake create_project<cr>", desc = "Create new project" },
    ["<leader>mc"] = { "<cmd>CMake configure<cr>", desc = "CMake configure" },
    ["<leader>ms"] = { "<cmd>CMake select_target<cr>", desc = "CMake select target" },
    ["<leader>mr"] = { "<cmd>CMake build_and_run<cr>", desc = "CMake run" },
    ["<leader>mt"] = { "<cmd>CMake select_build_type<cr>", desc = "CMake select build type" },
    ["<leader>mb"] = { "<cmd>CMake build<cr>", desc = "CMake build" },
    ["<leader>md"] = { "<cmd>CMake build_and_debug<cr>", desc = "CMake debug" },
    ["<leader>me"] = { "<cmd>CMake clean<cr>", desc = "CMake clean" },
    ["<leader>mq"] = { "<cmd>CMake cancel<cr>", desc = "CMake cancel" },
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
