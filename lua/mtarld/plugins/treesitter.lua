return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {"nvim-treesitter/nvim-treesitter-textobjects"},
  },
  cmd = { "BufEnter" },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "bash",
        "c",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "org",
        "php",
        "query",
        "twig",
        "vim",
        "vimdoc",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aA"] = "@attribute.outer",
            ["iA"] = "@attribute.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ia"] = "@parameter.inner",
            ["aa"] = "@parameter.outer",
            ["im"] = "@call.inner",
            ["am"] = "@call.outer",
            ["ax"] = "@comment.outer",
            ["iC"] = "@conditional.inner",
            ["aC"] = "@conditional.outer",
            ["iL"] = "@loop.inner",
            ["aL"] = "@loop.outer",
            ["aS"] = "@statement.outer",
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]]"] = "@class.outer",
            },
            goto_previous_start = {
              ["[["] = "@class.outer",
            },
          },
          include_surrounding_whitespace = function(opts)
            local qs = opts.query_string

            if     qs == '@function.inner' then return false
            elseif qs == '@class.outer' then return false
            elseif qs == '@call.outer' then return false
            elseif qs == '@comment.outer' then return false
            elseif qs == '@conditional.inner' then return false
            elseif qs == '@conditional.outer' then return false
            elseif qs == '@loop.inner' then return false
            elseif qs == '@loop.outer' then return false
            end

            return true
          end,
        },
      },
    }
  end
}
