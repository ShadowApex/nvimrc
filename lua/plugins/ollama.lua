return {
  -- CodeCompanion
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- Optional
      {
        "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        opts = {},
      },
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionToggle",
      "CodeCompanionActions",
    },
    config = true,
    opts = {
      strategies = {
        chat = "ollama",
        inline = "ollama",
      },
    },
  },

  -- Llama Copilot
  {
    "Faywyn/llama-copilot.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      host = "localhost",
      port = "11434",
      model = "llama3:latest",
      max_completion_size = 15, -- use -1 for limitless
      debug = false,
    },
  },
  --config = function()
  --  require("codecompanion").setup({
  --    adapters = {
  --      chat = require("codecompanion.adapters").use("ollama", {
  --        schema = {
  --          model = {
  --            default = "llama3:latest",
  --          },
  --        },
  --      }),
  --      inline = require("codecompanion.adapters").use("ollama", {
  --        schema = {
  --          model = {
  --            default = "llama3:latest",
  --          },
  --        },
  --      }),
  --    },
  --    --strategies = {
  --    --  chat = "ollama",
  --    --  inline = "ollama",
  --    --  --tool = "ollama",
  --    --},
  --  })
  --end,
}
