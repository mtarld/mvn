vim.g.mapleader = " "

-- quit neovim
vim.keymap.set("n", "<leader>qq", ":xa! <CR>")

-- save file
vim.keymap.set("n", "<leader>fs", ":w <CR>")

-- split window vertically
vim.keymap.set("n", "<leader>/", function ()
  vim.cmd('vsp')
  vim.cmd('wincmd l')
end)

-- split window horizontally
vim.keymap.set("n", "<leader>-", function ()
  vim.cmd('sp')
  vim.cmd('wincmd j')
end)

-- close window
vim.keymap.set("n", "<leader>x", "<C-w>q")

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
vim.keymap.set("n", "<leader>b<TAB>", function ()
  local previous_buffer = require("mtarld.core.buffer").previous_buffer()
  if nil == previous_buffer then
    return
  end

  vim.cmd("b " .. previous_buffer)
end)

-- remove search highlight on escape
vim.keymap.set("n", "<Esc>", ":noh <CR>")

-- toggle line wrap
vim.keymap.set("n", "<leader>W", ":set wrap! <CR>")

-- format PHP files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.keymap.set("n", "<leader>cs", require("mtarld.core.php-cs-fixer").format, { buffer = true })
  end,
})

-- Search and replace current position word
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
