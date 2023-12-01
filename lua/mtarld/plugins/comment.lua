return {
    "numToStr/Comment.nvim",
    keys = {
        {"<leader>cl", function()
            require("Comment.api").toggle.linewise.current()
        end},
        {"<leader>cl","<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode="v"},
    },
}
