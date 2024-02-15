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
      actions = {
        files = {
          ["default"] = actions.file_edit_or_qf,
          ["ctrl-/"] = actions.file_vsplit,
          ["alt-q"] = actions.file_sel_to_qf,
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
    { "<leader>.", "<CMD>FzfLua grep_visual<CR>", mode = "v" },
    { "<C-s>", "<CMD>FzfLua blines<CR>" },
    {
      "<leader>lf",
      function()
        require("fzf-lua").files({
          cwd = vim.fn.expand("%:p:h"),
        })
      end,
    },
    { "<leader> ", "<CMD>FzfLua files<CR>" },
    { "<leader>lb", "<CMD>FzfLua buffers<CR>" },
    { "<leader>ll", "<CMD>FzfLua lsp_finder<CR>" },
    { "<leader>ld", "<CMD>FzfLua lsp_document_diagnostics<CR>" },
    { "<leader>ca", "<CMD>FzfLua lsp_code_actions<CR>" },
    { "<leader>ls", "<CMD>FzfLua lsp_document_symbols<CR>" },
    { "<leader>lr", "<CMD>FzfLua registers<CR>" },
  },
}
