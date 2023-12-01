return {
  "anuvyklack/windows.nvim",
  dependencies = { "anuvyklack/middleclass" },
  cmd = { "WindowsMaximize", "WindowsEqualize" },
  config = function()
    require("windows").setup()
  end,
  keys = {
    {"<leader>m", "<cmd>WindowsMaximize <CR>" },
    {"<leader>=", "<cmd>WindowsEqualize <CR>" },
  },
}
