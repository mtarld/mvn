return {
  "nvim-pack/nvim-spectre",
  opts = {},
  cmd = "Spectre",
  keys = {
    {
      "<leader>ss",
      function()
        require("spectre").toggle()
      end,
    },
  },
}
