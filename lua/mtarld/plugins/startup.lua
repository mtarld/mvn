local function root_directory()
  local cmd = "git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel"
  local toplevel = vim.fn.system(cmd)

  if not toplevel or #toplevel == 0 or toplevel:match("fatal") then
    return vim.fn.getcwd()
  end

  return toplevel:sub(0, -2)
end

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

          table.insert(lines, root_directory())

          return lines
        end,
      },
      parts = { "section" },
    })
  end,
}
