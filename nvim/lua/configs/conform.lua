require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    json = { { "prettierd", "prettier" } },
    yaml = { "yamlfix" },
    toml = { "taplo" },
    html = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    markdown = { { "prettierd", "prettier" } },
    graphql = { { "prettierd", "prettier" } },
    go = { "goimports", "gofmt" },
    rust = { { "clippy", "rustfmt" } },
    sh = { { "shellcheck" } },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    terraform = { "terraformls" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}
