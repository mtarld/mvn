return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    },
    event = { "BufEnter" },
    config = function()
        local lsp = require('lsp-zero')

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({buffer = bufnr})
        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
          ensure_installed = {
            "lua_ls",
          },
          handlers = {
            lsp.default_setup,
          },
        })

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        require('lspconfig').phpactor.setup({})

        lsp.setup()

        local cmp = require('cmp')
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                    else
                        fallback()
                    end
                end, { "i", "s", }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
        })
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
    },
}
