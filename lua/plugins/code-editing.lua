return {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = { "davidmh/cspell.nvim" },
    opts = function(_, opts)
      local cspell = require("cspell")
      opts.sources = opts.sources or {}
      table.insert(
        opts.sources,
        cspell.diagnostics.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.HINT
          end,
        })
      )
      table.insert(opts.sources, cspell.code_actions)
    end,
  },
  { "j-hui/fidget.nvim", opts = {} },
  {
    "mhartington/formatter.nvim",
    lazy = true,
    cmd = {
      "Format",
      "FormatLock",
      "FormatWrite",
      "FormatWriteLock",
    },
    config = function()
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
            -- require("formatter.filetypes.lua").stylua,

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
                  "--indent-width",
                  "2",
                  "--indent-type",
                  "Spaces",
                  "--search-parent-directories",
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
            require("formatter.filetypes.javascript").prettier,
          },
          rust = {
            require("formatter.filetypes.rust").rustfmt,
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
          typst = {
            { exe = "typstyle", stdin = true, args = { "-q", "--wrap-text" } },
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
    end,
  },
  -- Comment
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
          ---Line-comment toggle keymap
          line = "<leader>cl ",
          ---Block-comment toggle keymap
          block = "<leader>cb ",
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = "<leader>cl",
          ---Block-comment keymap
          block = "<leader>cb",
        },
        ---LHS of extra mappings
        extra = {
          ---Add comment on the line above
          above = "gcO",
          ---Add comment on the line below
          below = "gco",
          ---Add comment at the end of line
          eol = "gcA",
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {

          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = false,
          ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
          extended = false,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
      })
    end,
  },
}
