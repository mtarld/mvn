return {
  "TimUntersberger/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  },
  opts = {
    kind = "replace",
  },
  keys = {
    { "<leader>gg", "<CMD>Neogit<CR>" },
  },
}
