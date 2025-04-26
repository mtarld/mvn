return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup({
        default_command_agent = "Copilot",
        default_chat_agent = "Copilot",
        providers = {
          openai = {
            disable = true,
          },
          copilot = {
            endpoint = "https://api.githubcopilot.com/chat/completions",
            secret = {
              "bash",
              "-c",
              "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
            },
          },
        },
        agents = {
          {
            provider = "copilot",
            name = "Copilot",
            chat = true,
            command = true,
            model = { model = "gpt-4o" },
            system_prompt = [[
Respond to user messages according to the following principles:
- Do not repeat the user's request and return only the response to the user's request.
- Unless otherwise specified, respond in the same language as used in the user's request.
- Be as accurate as possible.
- Be as truthful as possible.
- Be as comprehensive and informative as possible.
- Do not give any explanation unless explicitly asked for.
- In PHP use PHP 8 attributes and functionalities if possible (match, fn)
- Do not add comments explaining what you did, I understand the code
- You can add doc-block comments on function arguments if needed
- Do not change the given code even if the logic looks wrong, in that case just add a comment
            ]],
          },
        },
        hooks = {
          Implement = function(gp, params)
            local template = "Having following from {{filename}}:\n\n"
              .. "```{{filetype}}\n{{selection}}\n```\n\n"
              .. "Please rewrite this according to the contained instructions."
              .. "\n\nRespond exclusively with the snippet that should replace the selection above."

            local agent = gp.get_command_agent()

            gp.Prompt(params, gp.Target.rewrite, agent, template)
          end,
          CodeReview = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
              .. "```{{filetype}}\n{{selection}}\n```\n\n"
              .. "Please analyze for code smells and suggest improvements."
            local agent = gp.get_chat_agent()
            gp.Prompt(params, gp.Target.vnew("markdown"), agent, template)
          end,
          Explain = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
              .. "```{{filetype}}\n{{selection}}\n```\n\n"
              .. "Please respond by explaining the code above."
            local agent = gp.get_chat_agent()
            gp.Prompt(params, gp.Target.popup, agent, template)
          end,
        },
      })
    end,
    cmd = { "GpCodeReview", "GpExplain", "GpContext" },
    keys = {
      { "<leader>aa", ":GpChatToggle vsplit<CR>", mode = {"n", "i"} },
      { "<leader>aa", ":<C-u>'<,'>GpChatPaste vsplit<CR>", mode = "v" },
      { "<leader>ai", ":<C-u>'<,'>GpImplement<CR>", mode = "v" },
      { "<leader>ar", ":<C-u>'<,'>GpRewrite<CR>", mode = "v" },
    },
  },
}
