return {
  "kwkarlwang/bufjump.nvim",
  keys = {
    {
      "<C-n>",
      function()
        require("bufjump").backward()
      end,
    },
    {
      "<C-m>",
      function()
        require("bufjump").forward()
      end,
    },
  },
}
