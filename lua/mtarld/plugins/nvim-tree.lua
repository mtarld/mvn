return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        {"nvim-tree/nvim-web-devicons"},
    },
    cmd = { "NvimTreeToggle"},
    keys = {
        {"<C-n>", "<cmd> NvimTreeToggle <CR>"},
        {"<C-M-n>", "<cmd> NvimTreeFindFile <CR>"},
        {"<C-M-m>", "<cmd> NvimTreeCollapse <CR>"},
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true

        require("nvim-tree").setup({
            view = {
                adaptive_size = true
            },
            update_focused_file = {
                enable = false
            },
            git = {
                enable = true,
                ignore = false,
            },
            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                    },
                },
            },
            on_attach = function (bufnr)
                local api = require "nvim-tree.api"

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- custom mappings
                vim.keymap.set(
                    'n',
                    '.',
                    function ()
                       local node = api.tree.get_node_under_cursor()

                       if not node then
                           return
                       end

                       local cwd = node.cwd or node.link_to or node.absolute_path
                       if vim.fn.isdirectory(cwd) ~= 0 == false then
                         cwd = node.parent.cwd or node.parent.link_to or node.parent.absolute_path
                       end

                       require("telescope.builtin").live_grep({ cwd = cwd })
                    end,
                    opts('Search in directory')
                )
            end,
        })
    end,
}
