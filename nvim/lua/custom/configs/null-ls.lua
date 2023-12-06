local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

local sources = {
  b.diagnostics.todo_comments,
  b.diagnostics.trail_space,
  -- b.diagnostics.cspell,
  b.code_actions.cspell,

  -- prettier があればそちらを優先
  b.formatting.prettier.with {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "html",
      "css",
      "scss",
      "less",
      "graphql",
    },
    prefer_local = "node_modules/.bin",
    condition = function(utils)
      return utils.has_file { ".prettierrc", ".prettierrc.json", ".prettierrc.js" }
    end,
  },

  b.formatting.deno_fmt.with {
    condition = function(utils)
      return not (utils.has_file { ".prettierrc", ".prettierrc.json", ".prettierrc.js", "deno.json", "deno.jsonc" })
    end,
  },

  -- github actions
  b.diagnostics.actionlint,

  -- shell
  b.formatting.shfmt,
  b.code_actions.shellcheck,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- rust
  b.formatting.rustfmt,

  -- lua
  b.formatting.stylua,

  -- terraform
  b.formatting.terraform_fmt,

  -- go
  b.formatting.gofmt,
  b.formatting.gofumpt,
  b.formatting.goimports,

  -- json
  b.formatting.fixjson,

  -- toml
  b.formatting.taplo,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
}
