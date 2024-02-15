vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.cmd.colorscheme("catppuccin")
  end,
})

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "latte",
    no_italic = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      mason = true,
      native_lsp = {
        enabled = true,
      },
      neogit = true,
      treesitter = true,
    },
    custom_highlights = function(colors)
      return {
        CurSearch = { bg = colors.flamingo },
        FzfLuaBufName = { fg = colors.flamingo },
        FzfLuaBufNr = { fg = colors.flamingo },
        FzfLuaBufLineNr = { fg = colors.flamingo },
        FzfLuaBufFlagCur = { fg = colors.flamingo },
        FzfLuaBufFlagAlt = { fg = colors.flamingo },
        FzfLuaHeaderBind = { fg = colors.flamingo },
        Todo = { bg = colors.mantle, fg = colors.surface2 },
        PmenuSel = { bg = colors.mantle },
      }
    end,
  },
}
