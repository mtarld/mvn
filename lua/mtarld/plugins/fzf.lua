return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "junegunn/fzf", build = "./install --bin" },
  },
  config = function()
    local actions = require("fzf-lua.actions")

    require("fzf-lua").setup({
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
    })
  end,
  cmd = { "FzfLua" },
  keys = {
    {"<leader>.", "<cmd>FzfLua live_grep <CR>"},
    {"<C-p>", "<cmd>FzfLua resume <CR>"},
    {"<C-s>", function ()
      if (vim.bo.filetype == "dirbuf") then
        vim.cmd("FzfLua blines")
      else
        vim.cmd("FzfLua lgrep_curbuf")
      end
    end},
    {"<leader>ff", "<cmd>FzfLua lsp_live_workspace_symbols <CR>"},
    {"<leader> ", "<cmd>FzfLua files <CR>"},
    {"<leader>bb", "<cmd>FzfLua buffers <CR>"},
    {"<leader>#", "<cmd>FzfLua grep_cWORD <CR>"},
    {"<leader>#", "<cmd>FzfLua grep_visual <CR>", mode="v"},
    {"<leader>,", "<cmd>FzfLua lsp_finder <CR>"},
    {"<leader>?", "<cmd>FzfLua lsp_document_diagnostics <CR>"},
    {"<leader>cc", "<cmd>FzfLua lsp_code_actions <CR>"},
    {"<leader>ss", "<cmd>FzfLua lsp_document_symbols <CR>"},
    {"<leader>rr", "<cmd>FzfLua live_grep_resume <CR>"},
  },
}
