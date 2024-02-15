return {
  "b3nj5m1n/kommentary",
  config = function()
    local kommentary = require("kommentary.config")

    kommentary.configure_language("default", {
      prefer_single_line_comments = true,
      ignore_whitespace = false,
    })

    kommentary.configure_language("php", {
      single_line_comment_string = "//",
      multi_line_comment_strings = { "/*", "*/" },
    })
  end,
  keys = {
    { "<leader>cl", "<PLUG>kommentary_line_default" },
    { "<leader>cl", "<PLUG>kommentary_visual_default<C-c>", mode = "v" },
  },
}
