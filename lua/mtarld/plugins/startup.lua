return {
  "startup-nvim/startup.nvim",
  lazy = false,
  config = function()
    require("startup").setup({
      section = {
        type = "text",
        align = "center",
        highlight = "Normal",
        content = function()
          local lines = {}

          for _ = 1, math.floor((vim.o.lines / 2) - 1) do
            table.insert(lines, "")
          end

          table.insert(lines, require("mtarld.core.directory").root_directory())

          return lines
        end,
      },
      parts = { "section" },
    })
  end,
}
