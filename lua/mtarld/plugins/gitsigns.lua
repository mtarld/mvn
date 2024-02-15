return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true,
  },
  event = "BufRead",
  keys = {
    { "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>" },
    { "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>" },
  },
}
