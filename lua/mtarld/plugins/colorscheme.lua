return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        vim.cmd([[colorscheme catppuccin-latte]])

        require("catppuccin").setup({
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
            }
        })
    end,
}
