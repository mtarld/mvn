return {
  "TimUntersberger/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  },
  kind = "vsplit",
  config = function ()
    require("neogit").setup({
      kind = "replace",
    })
  end,
  keys = {
    {"<leader>gg", function()
      require("neogit").open()
    end},
  },
}
