require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

map("n", "<leader>dx", "<cmd> TroubleToggle <cr>", { desc = "Toggle trouble" })
map("n", "<leader>dd", "<cmd> TroubleToggle document_diagnostics <cr>", { desc = "Document diagnostics" })
map("n", "<leader>dD", "<cmd> TroubleToggle workspace_diagnostics <cr>", { desc = "Workspace diagnostics" })
map("n", "<leader>dl", "<cmd> TroubleToggle loclist <cr>", { desc = "Loclist" })
map("n", "<leader>dq", "<cmd> TroubleToggle quickfix <cr>", { desc = "Quickfix" })

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

map("n", "<leader>*", "*''cgn")

-- saga
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
-- map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>")
-- map("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
-- map("n", "ga", "<cmd>Lspsaga code_action<CR>")
-- map("n", "gn", "<cmd>Lspsaga rename<CR>")
-- map("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
