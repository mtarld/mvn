vim.g.mapleader = " "

vim.keymap.set("n", "<leader>qq", ":xa! <CR>")
vim.keymap.set("n", "<leader>fs", ":w <CR>")
vim.keymap.set("n", "<leader>el", "<cmd>e #<1<CR>")

vim.keymap.set("n", "<leader>/", function ()
  vim.cmd('vsp')
  vim.cmd('wincmd l')
end)
vim.keymap.set("n", "<leader>-", function ()
  vim.cmd('sp')
  vim.cmd('wincmd j')
end)
vim.keymap.set("n", "<leader>x", "<C-w>q")
vim.keymap.set("n", "<leader>r", "<C-w>r")

-- keep register when pasting
-- https://vi.stackexchange.com/a/39907
vim.keymap.set("x", "p", "P", { silent = true })

-- center view after moving verticaly
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>b<TAB>", function ()
  local buffers = vim.tbl_filter(function(b)
    return 1 == vim.fn.buflisted(b) and b ~= vim.api.nvim_get_current_buf()
  end, vim.api.nvim_list_bufs() or {})

  table.sort(buffers, function(a, b)
    return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
  end)

  local last_buffer = buffers[1]
  if nil == last_buffer then
    return
  end

  vim.cmd(string.format("b %s", last_buffer))
end)

vim.keymap.set("n", "<Esc>", ":noh <CR>")
vim.keymap.set("n", "<leader>W", ":set wrap! <CR>")
