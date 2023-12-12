vim.api.nvim_create_autocmd("FileType", {
  pattern = "dirbuf",
  callback = function()
    -- map "Ctrl-/" to open file in a vertical split
    vim.keymap.set("n", "<C-_>", function()
      require("dirbuf").enter("vsplit")
    end, { buffer = true })

    -- map "." to live grep in current directory
    vim.keymap.set("n", ".", function()
      local cwd = require("dirbuf").get_cursor_path()
      if vim.fn.isdirectory(cwd) ~= 0 == false then
        cwd = vim.fn.fnamemodify(cwd, ":p:h")
      end

      require("fzf-lua").live_grep({ cwd = cwd })
    end, { buffer = true })
  end,
})

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
