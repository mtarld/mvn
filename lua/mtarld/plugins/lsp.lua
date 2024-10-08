return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    local lspzero = require("lsp-zero")

    lspzero.on_attach(function(_, bufnr)
      lspzero.default_keymaps({ buffer = bufnr })
      vim.keymap.set("n", "<leader>R", function()
        vim.lsp.buf.rename()
      end, { buffer = bufnr })
    end)

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "phpactor",
        "eslint",
        "ts_ls",
        "html",
        "cssls",
        "yamlls",
        "jsonls",
        "dockerls",
        "ltex",
      },
      handlers = {
        lspzero.default_setup,
      },
    })
  end,
  event = "BufRead",
}
