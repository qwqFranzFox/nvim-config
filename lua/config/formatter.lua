-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--indent-width",
            "2",
            "--indent-type",
            "Spaces",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    c = {
      require("formatter.filetypes.c").clangformat,
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    javascript = {
      require("formatter.filetypes.cpp").clangformat,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          stdin = true,
          args = {
            "--edition=2021",
          },
        }
      end,
    },
    sh = {
      require("formatter.filetypes.sh").shfmt,
    },
    markdown = {
      require("formatter.filetypes.markdown").prettier,
    },
    python = {
      require("formatter.filetypes.python").autopep8,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    go = {
      require("formatter.filetypes.go").gofmt,
    },
    svelte = {
      function(parser)
        if not parser then
          return {
            exe = "prettier",
            args = {
              "--plugin-search-dir=.",
              "--stdin-filepath",
              util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
            try_node_modules = true,
          }
        end

        return {
          exe = "prettier",
          args = {
            "--plugin-search-dir=.",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--parser",
            parser,
          },
          stdin = true,
          try_node_modules = true,
        }
      end,
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      -- require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})
