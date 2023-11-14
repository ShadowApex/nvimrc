local wk = require("which-key")
return {
  "FabijanZulj/blame.nvim",
  config = function()
    vim.keymap.set("n", "<leader>gb", ":ToggleBlame window<CR>", {})
    wk.register({
      ["<leader>gb"] = { ":ToggleBlame window<CR>", "blame" },
    })
  end,
}
