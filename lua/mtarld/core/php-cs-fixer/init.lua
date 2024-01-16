local M = {}

local function is_file_readable(f)
  local stat = vim.loop.fs_stat(f)
  return stat and stat.type == "file" and vim.loop.fs_access(f, "R")
end

local function config_path()
  local root_directory = require("mtarld.core.directory").root_directory()

  local path = root_directory .. "/.php-cs-fixer.php"
  if is_file_readable(path) then
    return path
  end

  path = root_directory .. "/.php-cs-fixer.dist.php"
  if is_file_readable(path) then
    return path
  end

  return vim.fn.stdpath "config" .. "/lua/mtarld/core/php-cs-fixer/config.php"
end

M.format = function()
  print(string.format("silent! !php-cs-fixer fix --config=%s --quiet %s", config_path(), vim.fn.expand("%")))
  vim.cmd(string.format("silent! !php-cs-fixer fix --config=%s --quiet %s", config_path(), vim.fn.expand("%")))
  vim.cmd("silent! e")
end

return M
