local M = {}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.trouble = {
  n = {
    ["<leader>dx"] = { "<cmd> TroubleToggle <cr>", "Toggle trouble" },
    ["<leader>dd"] = { "<cmd> TroubleToggle document_diagnostics <cr>", "Document diagnostics" },
    ["<leader>dD"] = { "<cmd> TroubleToggle workspace_diagnostics <cr>", "Workspace diagnostics" },
    ["<leader>dl"] = { "<cmd> TroubleToggle loclist <cr>", "Loclist" },
    ["<leader>dq"] = { "<cmd> TroubleToggle quickfix <cr>", "Quickfix" },
  },
}

M.spectre = {
  n = {
    ["<leader>ss"] = { "<cmd> lua require('spectre').toggle() <cr>", "Toggle Spectre" },
  },
}

return M
