return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
    {"L3MON4D3/LuaSnip"},
  },
  config = function()
    local lspzero = require("lsp-zero")

    lspzero.on_attach(function(_, bufnr)
      lspzero.default_keymaps({ buffer = bufnr })
    end)

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "phpactor",
        "eslint",
        "tsserver",
        "html",
        "cssls",
        "yamlls",
        "jsonls",
        "dockerls",
      },
      handlers = {
        lspzero.default_setup,
      },
    })
  end,
  event = "BufRead",
  keys = {
    {
      "<leader>R",
      function()
        vim.lsp.buf.rename()
      end,
    },
  },
}
