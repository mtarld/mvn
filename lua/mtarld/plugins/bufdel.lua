return {
  "ojroques/nvim-bufdel",
  cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
  keys = {
    { "<leader>x", "<CMD>BufDel<CR>" },
    { "<leader>X", "<CMD>BufDelOthers<CR>" },
    { "<leader>qq", "<CMD>BufDelAll<CR>" },
  },
}
