require("bufferline").setup({
  options = {
    left_trunc_marker = "",
    right_trunc_marker = "",
    -- 使用 nvim 内置lsp
    diagnostics = "nvim_lsp",
    -- 左侧让出 nvim-tree 的位置
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
})
