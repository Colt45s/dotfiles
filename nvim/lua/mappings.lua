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

-- saga
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "lf", "<cmd>Lspsaga finder<CR>", { desc = "LSP Saga Finder" })
map("n", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
map("n", "lr", "<cmd>Lspsaga rename<CR>", { desc = "Rename All Occurrences" })
map("n", "lp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
map("n", "ld", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })
map("n", "lt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" })
map("n", "<Leader>ll", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show Line Diagnostics" })
map("n", "<Leader>lb", "<cmd>Lspsaga show_buf_diagnostics ++normal<CR>", { desc = "Show Buffer Diagnostics" })
map("n", "<Leader>lw", "<cmd>Lspsaga show_workspace_diagnostics ++normal<CR>", { desc = "Show Workspace Diagnostics" })
map("n", "<Leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Show Cursor Diagnostics" })
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Diagnostic Jump Previous" })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Diagnostic Jump Next" })

-- hop
map("n", "<leader>q", "<cmd>HopWord<CR>")

-- diffview
map("n", "<leader>ddo", "<cmd>DiffviewOpen<CR>")
map("n", "<leader>ddx", "<cmd>DiffviewClose<CR>")
map("n", "<leader>ddr", "<cmd>DiffviewRefresh<CR>")
map("n", "<leader>ddh", "<cmd>DiffviewFileHistory<CR>")

-- cgn -> n -> .
map("n", "<leader>*", "*''cgn")
