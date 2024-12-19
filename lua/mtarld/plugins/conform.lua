return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      php = { "php_cs_fixer" },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cs",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
    },
  },
}
