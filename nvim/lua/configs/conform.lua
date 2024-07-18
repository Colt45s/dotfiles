local function get_formatter()
  local current_dir = vim.fn.getcwd()
  if vim.fn.filereadable(current_dir .. "/.prettierrc.json") == 1 then
    return "prettierd"
  elseif vim.fn.filereadable(current_dir .. "/biome.json") == 1 then
    return "biome"
  elseif vim.fn.filereadable(current_dir .. "/deno.jsonc") == 1 then
    return "deno_fmt"
  else
    return nil
  end
end

local function setup()
  local f = get_formatter()
  local o = {
    formatters_by_ft = {
      lua = { "stylua" },
      json = { f },
      yaml = { "yamlfix" },
      toml = { "taplo" },
      html = { f },
      css = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      graphql = { { "prettierd", "prettier" } },
      go = { "goimports", "gofmt" },
      rust = { { "clippy", "rustfmt" } },
      sh = { { "shellcheck" } },
      javascript = { f },
      typescript = { f },
      javascriptreact = { f },
      typescriptreact = { f },
      terraform = { "terraformls" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  }

  require("conform").setup(o)
end

setup()
