return {
  "FooSoft/vim-argwrap",
  config = function()
    vim.g.argwrap_tail_comma = 1
  end,
  cmd = "ArgWrap",
  keys = {
    { "<leader>j", "<CMD>ArgWrap<CR>" },
  },
}
