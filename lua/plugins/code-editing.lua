return {
  { "j-hui/fidget.nvim", opts = {} },
  -- Comment
  {
    "numToStr/Comment.nvim",
    opts = {
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = "<leader>cl",
        ---Block-comment toggle keymap
        block = "<leader>cb",
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = "<leader>cl",
        ---Block-comment keymap
        block = "<leader>cb",
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
    }
  },
}
