return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "saghen/blink.cmp" },
  },
  config = function()
    local lspzero = require("lsp-zero")
    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup(lspzero.nvim_lua_ls())
    lspconfig.phpactor.setup({
      init_options = {
        ['language_server_worse_reflection.inlay_hints.enable'] = true,
        ['language_server_worse_reflection.inlay_hints.params'] = true,
        ['language_server_worse_reflection.inlay_hints.types'] = true,
        ['language_server_completion.trim_leading_dollar'] = true,
      },
    })

    local lspconfig_defaults = lspconfig.util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      require('blink.cmp').get_lsp_capabilities()
    )

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
      },
      handlers = {
        lspzero.default_setup,
      },
    })
  end,
  event = "BufRead",
}
