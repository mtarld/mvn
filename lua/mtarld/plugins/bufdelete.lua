local function close_all_bufs_except_current()
  local bufdelete = require('bufdelete')

  for _, buf in ipairs(require("mtarld.utils.buffers").get_buffers{ignore_current_buffer=true}) do
    bufdelete.bufdelete(buf)
  end
end

local function close_all_bufs()
  local bufdelete = require('bufdelete')

  for _, buf in ipairs(require("mtarld.utils.buffers").get_buffers()) do
    bufdelete.bufdelete(buf)
  end
end

return {
  "famiu/bufdelete.nvim",
  cmd = { "Bdelete" },
  keys = {
    {"<leader>bd", "<cmd>Bdelete <CR>"},
    {"<leader>bo", function()
      close_all_bufs_except_current()
    end},
    {"<leader>ba", function()
      close_all_bufs()
    end},
  },
}
