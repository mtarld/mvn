vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "R", function()
      require("replacer").run({ rename_files = false })
    end, { buffer = true })
  end,
})

return {
  "gabrielpoca/replacer.nvim",
}
