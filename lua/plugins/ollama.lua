return {
  -- CodeCompanion
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- Optional
    },
    init = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>a", group = "ai", icon = "", mode = { "n", "v" } },
      })
    end,
    keys = {
      { "<leader>ai", "<cmd>CodeCompanionChat<cr>", desc = "AI Chat", mode = { "n", "v" } },
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions", mode = { "n", "v" } },
    },
    config = true,
    opts = {
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              url = "http://192.168.0.50:11434",
            },
            schema = {
              model = {
                --default = "qwen2.5-coder:latest",
                --default = "llama3.2:latest",
                default = "gemma3:latest",
                --default = "deepseek-r1:latest",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
      },
      prompt_library = {
        ["Generate comment"] = {
          strategy = "inline",
          description = "Write a comment for the selected code",
          prompts = {
            {
              role = "system",
              content = function(context)
                return "I want you to act as a senior " .. context.filetype .. " developer."
              end,
            },
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
                return "Write a concise comment block for the following code:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
                placement = "before",
              },
            },
          },
        },
      },
    },
  },
  -- Minuet
  {
    "milanglacier/minuet-ai.nvim",
    opts = {
      provider = "openai_fim_compatible",
      n_completions = 1, -- recommend for local model for resource saving
      -- I recommend beginning with a small context window size and incrementally
      -- expanding it, depending on your local computing power. A context window
      -- of 512, serves as an good starting point to estimate your computing
      -- power. Once you have a reliable estimate of your local computing power,
      -- you should adjust the context window to a larger value.
      context_window = 512,
      provider_options = {
        openai_fim_compatible = {
          -- For Windows users, TERM may not be present in environment variables.
          -- Consider using APPDATA instead.
          api_key = "TERM",
          name = "Ollama",
          --end_point = "http://localhost:11434/v1/completions",
          end_point = "http://192.168.0.50:11434/v1/completions",
          model = "qwen2.5-coder:latest",
          --model = "llama3.2:latest",
          optional = {
            max_tokens = 56,
            top_p = 0.9,
          },
        },
      },
    },
  },
  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      --table.insert(opts.sources, { name = "minuet" })
      --opts.mapping["<A-y>"] = require("minuet").make_cmp_map()
      --opts.performance = { fetching_timeout = 3000 }
    end,
  },
}
