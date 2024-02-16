return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
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
          FzfLuaBufName = { fg = colors.flamingo },
          FzfLuaBufNr = { fg = colors.flamingo },
          FzfLuaBufLineNr = { fg = colors.flamingo },
          FzfLuaBufFlagCur = { fg = colors.flamingo },
          FzfLuaBufFlagAlt = { fg = colors.flamingo },
          FzfLuaHeaderBind = { fg = colors.flamingo },
          PmenuSel = { bg = colors.mantle },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
