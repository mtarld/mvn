return {
  'saghen/blink.cmp',
  version = 'v0.11.0',
  lazy = false, -- lazy loading handled internally
  dependencies =  {
    { "rafamadriz/friendly-snippets" },
    { "giuxtaposition/blink-cmp-copilot" }
  },
  opts_extend = { "sources.default" },
  opts = {
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_and_accept' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
    },
    sources = {
      cmdline = function()
        local type = vim.fn.getcmdtype()

        if type == ':' or type == '@' then
          return { 'cmdline' }
        end

        return {}
      end,
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
      kind_icons = {
        Copilot = "",
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      },
    },
  }
}
