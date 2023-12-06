return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = false,
      theme = 'catppuccin',
      component_separators = { left = '| ', right = ' |'},
      section_separators = '',
    },
    sections = {
      lualine_c = {
        {
          'filename',

          -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory
          path = 3,
        },
      },
      lualine_x = {
        "filetype",
      },
    },
    extensions = {
      "quickfix",
    },
  },
}
