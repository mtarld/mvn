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
    {
      "<leader>ss",
      function()
        require("spectre").open_visual()
      end,
      mode = "v",
    },
    {
      "<leader>sf",
      function()
        require("spectre").open_file_search()
      end,
    },
  },
}
