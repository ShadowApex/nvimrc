local keymap = "<C-a>"
return {
  "David-Kunz/gen.nvim",
  config = function()
    local gen = require("gen")
    -- LLM Model
    --gen.model = "minstral:instruct"

    -- Custom prompts
    require("gen").prompts["Elaborate_Text"] = {
      prompt = "Elaborate the following text:\n$text",
      replace = true,
    }
    require("gen").prompts["Fix_Code"] = {
      prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```",
    }

    -- Keybindings
    vim.keymap.set("n", keymap, ":Gen<CR>", {})
  end,
}
