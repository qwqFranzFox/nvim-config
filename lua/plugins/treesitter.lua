return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html",
          "css",
          "vim",
          "lua",
          "javascript",
          "typescript",
          "tsx",
          "bash",
          "rust",
          "make",
          "cmake",
          "python",
          "cpp",
          "c",
          "html",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
          },
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
