return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "BufRead",
  opts = {
    default_mappings = false,
    default_commands = true,
    disable_diagnostics = false,
  },
  keys = {
    { "<leader>gxo", "<cmd>GitConflictChooseOurs<cr>",   desc = "Conflict: choose ours" },
    { "<leader>gxt", "<cmd>GitConflictChooseTheirs<cr>", desc = "Conflict: choose theirs" },
    { "<leader>gxb", "<cmd>GitConflictChooseBoth<cr>",   desc = "Conflict: choose both" },
    { "<leader>gx0", "<cmd>GitConflictChooseNone<cr>",   desc = "Conflict: choose none" },
    { "]x",          "<cmd>GitConflictNextConflict<cr>",  desc = "Conflict: next" },
    { "[x",          "<cmd>GitConflictPrevConflict<cr>",  desc = "Conflict: previous" },
    { "<leader>gx",  "<cmd>GitConflictListQf<cr>",        desc = "Conflict: list all" },
  },
}
