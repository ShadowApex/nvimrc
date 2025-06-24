return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      -- See Setup section below
    })
    local wk = require("which-key")
    wk.add({
      { "<leader>z", group = "notes", icon = "", mode = "n" },
      { "<leader>zz", ":ZkNotes<CR>", desc = "Search notes" },
      { "<leader>zi", ":ZkInsertLink<CR>", desc = "Insert page link", icon = "" },
      { "<leader>zb", ":ZkBacklinks<CR>", desc = "Show backlinks", icon = "󰿨" },
      { "<leader>zt", ":ZkTags<CR>", desc = "Show tags", icon = "" },
      { "<leader>zl", ":ZkLinks<CR>", desc = "Show links", icon = "" },
      { "<leader>z", group = "notes", icon = "", mode = "v" },
      { "<leader>zn", ":ZkNewFromTitleSelection<CR>", desc = "Create note from text", icon = "", mode = "v" },
    })
  end,
}
