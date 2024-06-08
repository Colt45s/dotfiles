local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "tsserver",
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
  "denols",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    rust_analyzer = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        allFeatures = true,
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
      checkOnSave = {
        command = "cargo clippy",
      },
      cachePriming = {
        enable = true,
      },
    },
  },
}
