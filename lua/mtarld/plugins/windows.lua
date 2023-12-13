vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    vim.cmd("WindowsEqualize")
  end,
})

return {
  "anuvyklack/windows.nvim",
  dependencies = { "anuvyklack/middleclass" },
  cmd = { "WindowsMaximize", "WindowsEqualize" },
  event = { "VimResized" },
  config = function()
    require("windows").setup()
  end,
  keys = {
    {"<leader>m", "<cmd>WindowsMaximize <CR>" },
    {"<leader>=", "<cmd>WindowsEqualize <CR>" },
  },
}
