require "nvchad.mappings"

local map = vim.keymap.set

-- copilot
map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

-- spectre
map("n", "<leader>ss", "<cmd> lua require('spectre').toggle() <cr>", { desc = "Toggle Spectre" })
map(
  "n",
  "<leader>sw",
  "<cmd> lua require('spectre').open_visual({select_word=true}) <cr>",
  { desc = "Search current word" }
)
map(
  "n",
  "<leader>sp",
  "<cmd> lua require('spectre').open_file_search({select_word=true})<cr>",
  { desc = "Search on current file" }
)
map("v", "<leader>sw", "<cmd> lua require('spectre').open_visual() <cr>", { desc = "Search current word" })

-- hop
map("n", "<leader>q", "<cmd>HopWord<CR>")

-- diffview
map("n", "<leader>ddo", "<cmd>DiffviewOpen<CR>")
map("n", "<leader>ddx", "<cmd>DiffviewClose<CR>")
map("n", "<leader>ddr", "<cmd>DiffviewRefresh<CR>")
map("n", "<leader>ddh", "<cmd>DiffviewFileHistory<CR>")

-- cgn -> n -> .
map("n", "<leader>*", "*''cgn")

map("n", "<leader>rcu", function()
  require("crates").update_all_crates()
end, { desc = "Update all crates" })
