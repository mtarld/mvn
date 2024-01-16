local M = {}

M.previous_buffer = function()
  local buffers = vim.tbl_filter(function(b)
    return 1 == vim.fn.buflisted(b) and b ~= vim.api.nvim_get_current_buf()
  end, vim.api.nvim_list_bufs() or {})

  table.sort(buffers, function(a, b)
    return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
  end)

  return buffers[1]
end

return M
