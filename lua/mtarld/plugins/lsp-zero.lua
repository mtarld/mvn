return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {"hrsh7th/cmp-nvim-lsp"},
  },
  event = { "BufEnter" },
  config = function()
    local lsp = require("lsp-zero")
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    lsp.on_attach(function(_, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)

    mason.setup({})
    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
      },
      handlers = {
        lsp.default_setup,
      },
    })

    lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
    lspconfig.phpactor.setup({
      require("cmp_nvim_lsp").default_capabilities()
    })

    lsp.setup()
  end,
  keys = {
    {"<leader>ca", function()
      vim.lsp.buf.code_action()
    end},
    {"<leader>ca", function()
      vim.lsp.buf.code_action()
    end, mode="v"},
    {"K", function()
      vim.lsp.buf.hover()
    end},
    {"<leader>R", function ()
      vim.lsp.buf.rename()
    end}
  },
}
