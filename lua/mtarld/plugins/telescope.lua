local function get_target_dir(prompt_bufnr)
  local finder = require("telescope.actions.state").get_current_picker(prompt_bufnr).finder
  local entry_path
  if finder.files == false then
    local entry = require("telescope.actions.state").get_selected_entry()
    entry_path = entry and entry.value
  end
  return finder.files and finder.path or entry_path
end

local function delete_buffer(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local current_picker = action_state.get_current_picker(prompt_bufnr)

  current_picker:delete_selection(function(selection)
    local force = vim.api.nvim_buf_get_option(selection.bufnr, "buftype") == "terminal"
    require("bufdelete").bufdelete(selection.bufnr, force)
  end)
end

local function get_visual_selection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})

    text = string.gsub(text, "\n", "")

    if #text > 0 then
        return text
    else
        return ''
    end
end

local function live_grep(prompt_bufnr, opts)
  local options = opts or {}

  local rg_args = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
  }

  if options.unrestricted or false == true then
    rg_args[#rg_args + 1] = "-uu"
  end

  local live_grep_opts = {
    string.format("vimgrep_arguments=%s", table.concat(rg_args, ','))
  }

  if prompt_bufnr ~= nil then
    live_grep_opts[#live_grep_opts + 1] = string.format("cwd=%s", get_target_dir(prompt_bufnr))
  end

  vim.cmd(string.format(
    "Telescope live_grep %s",
    table.concat(live_grep_opts, ' ')
  ))
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    cmd = { "Telescope" },
    config = function()
        local telescope = require("telescope")

        telescope.setup {
            defaults = {
                file_ignore_patterns = { ".git", "node_modules" },

                -- hack to set ivy theme as default
                layout_strategy = 'bottom_pane',
                layout_config = {
                    height = 25,
                },
                border = true,
                sorting_strategy = "ascending",
                borderchars = {
                    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                    results = { " " },
                    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                },
            },
            pickers = {
              buffers = {
                sort_mru = true,
                mappings = {
                  i = {
                    ["<C-x>"] = delete_buffer
                  },
                  n = {
                    ["<C-x>"] = delete_buffer
                  },
                },
              },
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    mappings = {
                        n = {
                            ["."] = live_grep,
                        },
                    },
                },
            }
        }

        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
        telescope.load_extension("ui-select")
    end,
    keys = {
        {"<leader>.", ":Telescope live_grep <CR>"},
        {"<C-f>", "<cmd> Telescope current_buffer_fuzzy_find<CR>"},
        {"<leader> ", "<cmd> Telescope find_files hidden=true<CR>"},
        {"<leader>ff", function()
            vim.cmd("Telescope file_browser hidden=true grouped=true cwd_to_path=true path=" .. vim.fn.expand("%:p:h"))
        end},
        {"<leader>bb", "<cmd>Telescope buffers <CR>"},
        {"gd", "<cmd>Telescope lsp_definitions <CR>"},
        {"gr", "<cmd>Telescope lsp_references <CR>"},
        {"gi", "<cmd>Telescope lsp_implementations <CR>"},
        {"<leader>#", function()
            vim.cmd("Telescope live_grep no_ignore=true default_text=" .. vim.fn.expand("<cword>"))
        end},
        {"<leader>#", function()
            local text =
            vim.cmd("Telescope live_grep no_ignore=true default_text=" .. get_visual_selection())
        end, mode="v"},
    },
}
