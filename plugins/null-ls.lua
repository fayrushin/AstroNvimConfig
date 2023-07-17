return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local h = require "null-ls.helpers"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/formatting/prettier.lua
      null_ls.builtins.formatting.prettier.with {
        args = h.range_formatting_args_factory({
          "--stdin-filepath",
          "--ignore-path=.prettierignore",
          "$FILENAME",
        }, "--range-start", "--range-end", { row_offset = -1, col_offset = -1 }),
      },
    }
    return config -- return final config table
  end,
}
