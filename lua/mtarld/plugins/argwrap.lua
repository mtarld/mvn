return {
  "FooSoft/vim-argwrap",
  cmd = { "ArgWrap" },
  config = function ()
    vim.g.argwrap_tail_comma = 1
  end,
  keys = {
    {"<leader>j", "<cmd> ArgWrap<CR>"},
  },
}
