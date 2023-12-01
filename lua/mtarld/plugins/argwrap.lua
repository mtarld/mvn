return {
    "FooSoft/vim-argwrap",
    cmd = { "ArgWrap" },
    config = function()
        vim.keymap.set("n", "<leader>j", "<cmd> ArgWrap<CR>")
    end,
}
