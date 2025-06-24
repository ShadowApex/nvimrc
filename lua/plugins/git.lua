local wk = require("which-key")
return {
  "FabijanZulj/blame.nvim",
  config = function()
    vim.keymap.set("n", "<leader>gb", ":ToggleBlame window<CR>", {})
    wk.add({
      { "<leader>gb", ":ToggleBlame window<CR>", desc = "blame" },
    })
  end,
}
