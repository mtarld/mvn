return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    require('gitsigns').setup()
  end,
  event = { "BufEnter" },
  keys = {
    {"<leader>gr", function()
      require("gitsigns").reset_hunk()
    end},
    {"<leader>gp", function()
      require("gitsigns").preview_hunk()
    end},
  },
}
