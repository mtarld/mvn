return {
  "TimUntersberger/neogit",
  dependencies = { "nvim-lua/plenary.nvim" },
  kind = "vsplit",
  config = function ()
    require("neogit").setup()
  end,
  keys = {
    {"<leader>gg", function()
      require("neogit").open()
    end},
  },
}
