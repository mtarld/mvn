vim.g.mapleader = " "

-- save file
vim.keymap.set("n", "<leader>fs", "<CMD>w<CR>")

-- split window vertically
vim.keymap.set("n", "<leader>/", function()
  vim.cmd("vsp")
  vim.cmd("wincmd l")
end)

-- split window horizontally
vim.keymap.set("n", "<leader>-", function()
  vim.cmd("sp")
  vim.cmd("wincmd j")
end)

-- equalize windows
vim.keymap.set("n", "<leader>=", function()
  vim.cmd("wincmd =")
end)

-- close window
vim.keymap.set("n", "<leader>0", "<C-w>q")

-- rotate windows
vim.keymap.set("n", "<leader>r", "<C-w>r")

-- keep register when pasting (https://vi.stackexchange.com/a/39907)
vim.keymap.set("x", "p", "P", { silent = true })

-- center view after moving verticaly
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- switch to previous buffer
vim.keymap.set("n", "<leader>b<TAB>", function()
  local buffers = vim.tbl_filter(function(b)
    return 1 == vim.fn.buflisted(b) and b ~= vim.api.nvim_get_current_buf()
  end, vim.api.nvim_list_bufs() or {})

  table.sort(buffers, function(a, b)
    return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
  end)

  local previous_buffer = buffers[1]

  if nil == previous_buffer then
    return
  end

  vim.cmd("b " .. previous_buffer)
end)

-- remove search highlight on escape
vim.keymap.set("n", "<Esc>", ":noh <CR>")

-- toggle line wrap
vim.keymap.set("n", "<leader>W", ":set wrap! <CR>")

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
