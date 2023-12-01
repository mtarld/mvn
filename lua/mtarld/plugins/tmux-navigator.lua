return {
    "christoomey/vim-tmux-navigator",
    cmd = { "TmuxNavigateLeft", "TmuxNavigateRight", "TmuxNavigateTop", "TmuxNavigateBottom" },
    keys = {
        {"<C-h>", "<cmd> TmuxNavigateLeft<CR>"},
        {"<C-j>", "<cmd> TmuxNavigateDown<CR>"},
        {"<C-k>", "<cmd> TmuxNavigateUp<CR>"},
        {"<C-l>", "<cmd> TmuxNavigateRight<CR>"},
    },
}
