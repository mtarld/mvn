return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    if "true" == os.getenv("DARK_THEME") then
      vim.cmd.colorscheme("github_dark_dimmed")
    else
      vim.cmd.colorscheme("github_light_default")
    end
  end,
  keys = {
    {
      "<leader>tt",
      function()
        if vim.g.colors_name == "github_light_default" then
          vim.cmd.colorscheme("github_dark_dimmed")
        else
          vim.cmd.colorscheme("github_light_default")
        end
      end,
    },
  },
}
