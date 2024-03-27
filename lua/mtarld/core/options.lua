vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.splitright = true

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard:append("unnamedplus")

vim.opt.scrolloff = 8

vim.opt.wrap = false

vim.o.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "ColorColumn",
      timeout = 200,
    })
  end,
})
