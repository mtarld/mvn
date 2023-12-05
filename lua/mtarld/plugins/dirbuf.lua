return {
  "elihunter173/dirbuf.nvim",
  cmd = { "Dirbuf" },
  config = function ()
    require("dirbuf").setup({
      write_cmd = "DirbufSync -confirm",
    })
  end,
  keys = {
    {"<leader>oo", "<cmd>Dirbuf <CR>"},
  },
}
