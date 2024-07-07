local configs = require "nvchad.configs.lspconfig"
local on_init = configs.on_init
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "gopls",
  "yamlls",
  "bashls",
  "jsonls",
  "dockerls",
  "terraformls",
  "tflint",
  "emmet_ls",
  "sqlls",
  "eslint",
  "lua_ls",
  "graphql",
  "marksman",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      function()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
        vim.lsp.buf.execute_command(params)
      end,
    },
  },
}
