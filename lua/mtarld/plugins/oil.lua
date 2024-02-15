vim.keymap.set("n", "-", ":Oil<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    -- map ">" to live grep in current directory
    vim.keymap.set("n", ">", function()
      local oil = require("oil")

      local entry = oil.get_cursor_entry()
      local dir = oil.get_current_dir()
      if not entry or not dir then
        return
      end

      local path = dir .. entry.name
      if vim.fn.isdirectory(path) ~= 0 == false then
        path = vim.fn.fnamemodify(path, ":p:h")
      end

      require("fzf-lua").live_grep({ cwd = path })
    end, { buffer = true })
  end,
})

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    use_default_keymaps = false,
    keymaps = {
      ["<CR>"] = "actions.select",
      ["<leader><CR>"] = "actions.select_vsplit",
      ["<leader>p"] = "actions.preview",
      ["<C-r>"] = "actions.refresh",
    },
    view_options = {
      show_hidden = true,
    },
    lsp_rename_autosave = true,
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
  },
  cmd = "Oil",
}
