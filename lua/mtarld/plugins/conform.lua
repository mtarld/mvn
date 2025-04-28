return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      php_cs_fixer = {
        env = {
          PHP_CS_FIXER_IGNORE_ENV = 1,
        },
        cwd = function(_, ctx)
          return vim.fs.root(ctx.dirname, { ".git", ".mtarld" }) -- Symfony has several composer.json files
        end,
        append_args = function(self, ctx)
          local project_dir = self.cwd(self, ctx)
          local config_file = vim.fn.expand('~/.config/php-cs-fixer/.php-cs-fixer.php')

          if vim.fn.filereadable(project_dir .. '/.php-cs-fixer.php') == 1 then
            config_file = project_dir .. '/.php-cs-fixer.php'
          end

          if vim.fn.filereadable(project_dir .. '/.php-cs-fixer.dist.php') == 1 then
            config_file = project_dir .. '/.php-cs-fixer.dist.php'
          end

          return { "--config", config_file }
        end,
      },
    },
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
