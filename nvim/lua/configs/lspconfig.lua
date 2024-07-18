local configs = require "nvchad.configs.lspconfig"
local on_init = configs.on_init
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local marker = require "climbdir.marker"
local climbdir = require "climbdir"

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

lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = function(path)
    local found =
      climbdir.climb(path, marker.one_of(marker.has_readable_file "deno.json", marker.has_readable_file "deno.jsonc"), {
        halt = marker.one_of(marker.has_readable_file "package.json"),
      })
    return found
  end,
  init_options = {
    lint = true,
    unstable = true,
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  root_dir = function(path)
    local found = climbdir.climb(
      path,
      marker.one_of(marker.has_readable_file "tsconfig.json", marker.has_readable_file "package.json"),
      {
        halt = marker.one_of(marker.has_readable_file "deno.json", marker.has_readable_file "deno.jsonc"),
      }
    )
    return found
  end,
  single_file_support = false,
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
