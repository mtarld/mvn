return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.2.0',

  opts = {
    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      use_nvim_cmp_as_default = true,
    },
  }
}
