return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "junegunn/fzf", build = "./install --bin" },
  },
  opts = function()
    local actions = require("fzf-lua.actions")

    return {
      fzf_colors = {
        ["fg"] = { "fg", "CursorLine" },
        ["bg"] = { "bg", "Normal" },
        ["hl"] = { "fg", "CursorLine" },
        ["fg+"] = { "fg", "Normal" },
        ["bg+"] = { "bg", "CursorLine" },
        ["hl+"] = { "fg", "Normal" },
        ["info"] = { "fg", "Comment" },
        ["prompt"] = { "fg", "Normal" },
        ["pointer"] = { "fg", "Exception" },
        ["marker"] = { "fg", "Keyword" },
        ["spinner"] = { "fg", "Comment" },
        ["header"] = { "fg", "Comment" },
        ["gutter"] = { "bg", "CursorLine" },
      },
      grep = {
        -- override color=always
        rg_opts = "--column --line-number --no-heading --color=never --smart-case --max-columns=4096 -e",
      },
      keymap = {
        fzf = {
          ["ctrl-u"] = "half-page-up",
          ["ctrl-d"] = "half-page-down",
          ["alt-a"] = "toggle-all",
        },
      },
      winopts = {
        split = "botright new",
        preview = {
          hidden = "hidden",
        },
      },
    }
  end,
  cmd = "FzfLua",
  keys = {
    { "<leader>.", "<CMD>FzfLua live_grep<CR>" },
    { "<leader> ", "<CMD>FzfLua files<CR>" },
    { "<leader>ld", "<CMD>FzfLua lsp_document_diagnostics<CR>" },
    { "<leader>ca", "<CMD>FzfLua lsp_code_actions<CR>" },
    { "<leader>lr", "<CMD>FzfLua registers<CR>" },
  },
}
