return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    if "true" == os.getenv("DARK_THEME") then
      vim.cmd.colorscheme("github_dark")
    else
      vim.cmd.colorscheme("github_light")
    end
  end,
  keys = {
    {
      "<leader>tt",
      function()
        if vim.g.colors_name == "github_light" then
          vim.cmd.colorscheme("github_dark")
        else
          vim.cmd.colorscheme("github_light")
        end
      end,
    },
  },
}
