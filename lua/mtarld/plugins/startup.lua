return {
  "startup-nvim/startup.nvim",
  lazy = false,
  opts = {
    section = {
      type = "text",
      align = "center",
      highlight = "Normal",
      content = function()
        local lines = {}

        for _ = 1, math.floor((vim.o.lines / 2) - 1) do
          table.insert(lines, "")
        end

        local root_directory = vim.fn.getcwd()
        local root_level = vim.fn.system("git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel")

        if root_level and #root_level ~= 0 and not root_level:match("fatal") then
          root_directory = root_level:sub(0, -2)
        end

        table.insert(lines, root_directory)

        return lines
      end,
    },
    parts = { "section" },
  },
}
