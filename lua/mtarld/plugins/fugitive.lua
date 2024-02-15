return {
  "tpope/vim-fugitive",
  keys = {
    {
      "<leader>gc",
      function()
        vim.ui.input({ prompt = "Compare with (origin/main): " }, function(input)
          local branch = input or "origin/main"
          vim.cmd("vert Git -p show " .. branch .. ":%")
        end)
      end,
    },
    {
      "<leader>gb",
      function()
        local excluded_buftypes = {
          "nofile",
        }

        if vim.tbl_contains(excluded_buftypes, vim.bo.buftype) then
          return
        end

        if "fugitiveblame" == vim.bo.filetype then
          vim.cmd("q")
        else
          vim.cmd('Git blame --date=format:"%Y-%m-%d"')
        end
      end,
    },
  },
}
