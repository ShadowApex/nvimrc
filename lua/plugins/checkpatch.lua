return {
  "Deedone/checkpatch.nvim",
  init = function()
    vim.g.checkpatch_enabled = 1
    vim.g.checkpatch_path = "/path/to/checkpatch.pl"
  end,
}
