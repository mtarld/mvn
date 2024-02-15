return {
  "christoomey/vim-tmux-navigator",
  cmd = { "TmuxNavigateLeft", "TmuxNavigateRight", "TmuxNavigateTop", "TmuxNavigateBottom" },
  keys = {
    { "<C-h>", "<CMD>TmuxNavigateLeft<CR>" },
    { "<C-j>", "<CMD>TmuxNavigateDown<CR>" },
    { "<C-k>", "<CMD>TmuxNavigateUp<CR>" },
    { "<C-l>", "<CMD>TmuxNavigateRight<CR>" },
  },
}
