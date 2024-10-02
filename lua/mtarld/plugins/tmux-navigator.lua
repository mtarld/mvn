return {
  "christoomey/vim-tmux-navigator",
  cmd = { "TmuxNavigateLeft", "TmuxNavigateRight", "TmuxNavigateTop", "TmuxNavigateBottom" },
  keys = {
    { "<C-h>", ":TmuxNavigateLeft<CR>" },
    { "<C-j>", ":TmuxNavigateDown<CR>" },
    { "<C-k>", ":TmuxNavigateUp<CR>" },
    { "<C-l>", ":TmuxNavigateRight<CR>" },
  },
}
