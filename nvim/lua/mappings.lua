require "nvchad.mappings"

local map = vim.keymap.set

-- copilot
map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

-- trouble
map("n", "<leader>dx", "<cmd> TroubleToggle <cr>", { desc = "Toggle trouble" })
map("n", "<leader>dd", "<cmd> TroubleToggle document_diagnostics <cr>", { desc = "Document diagnostics" })
map("n", "<leader>dD", "<cmd> TroubleToggle workspace_diagnostics <cr>", { desc = "Workspace diagnostics" })
map("n", "<leader>dl", "<cmd> TroubleToggle loclist <cr>", { desc = "Loclist" })
map("n", "<leader>dq", "<cmd> TroubleToggle quickfix <cr>", { desc = "Quickfix" })

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

-- saga
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "LSP Saga Finder" })
map("n", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
map("n", "gr", "<cmd>Lspsaga rename<CR>", { desc = "Rename All Occurrences" })
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" })
map("n", "<Leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show Line Diagnostics" })
map("n", "<Leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Show Buffer Diagnostics" })
map("n", "<Leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Show Workspace Diagnostics" })
map("n", "<Leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Show Cursor Diagnostics" })
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Diagnostic Jump Previous" })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Diagnostic Jump Next" })
-- hop
map("n", "<leader>q", "<cmd>HopWord<CR>")

-- diffview
map("n", "<leader>go", "<cmd>DiffviewOpen<CR>")
map("n", "<leader>gx", "<cmd>DiffviewClose<CR>")
map("n", "<leader>gr", "<cmd>DiffviewRefresh<CR>")
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>")

-- cgn -> n -> .
map("n", "<leader>*", "*''cgn")
