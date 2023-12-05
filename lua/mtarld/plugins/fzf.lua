return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "junegunn/fzf", build = "./install --bin" },
  },
  config = function()
    local actions = require("fzf-lua.actions")

    require("fzf-lua").setup({
      "fzf-native",
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
        height = 1,
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
    {"<leader>ff", function ()
      vim.cmd("FzfLua files cwd=" .. vim.fn.expand("%:p:h"))
    end},
    {"<leader> ", "<cmd>FzfLua files <CR>"},
    {"<leader>bb", "<cmd>FzfLua buffers <CR>"},
    {"<leader>#", "<cmd>FzfLua grep_cWORD <CR>"},
    {"<leader>#", "<cmd>FzfLua grep_visual <CR>", mode="v"},
    {"<leader>,", "<cmd>FzfLua lsp_finder <CR>"},
    {"<leader>?", "<cmd>FzfLua lsp_document_diagnostics <CR>"},
    {"<leader>cc", "<cmd>FzfLua lsp_code_actions <CR>"},
    {"<leader>ss", "<cmd>FzfLua lsp_live_workspace_symbols <CR>"},
  },
}
