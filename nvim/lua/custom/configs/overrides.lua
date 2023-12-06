local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "prisma",
    "go",
    "gomod",
    -- "rust",
    "graphql",
    "http",
    "bash",
    "terraform",
    "hcl",
    "toml",
    "yaml",
    "json",
    "jsonc",
    "comment",
    "dockerfile",
    "rego",
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- docker
    "dockerfile-language-server",

    -- yaml
    "yaml-language-server",

    -- lua
    "lua-language-server",
    "stylua",

    -- web
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "emmet-ls",
    "json-lsp",
    "eslint-lsp",

    -- rust
    -- "rust-analyzer",

    -- terraform
    "terraform-ls",

    -- go
    "gopls",

    -- shell
    "cspell",
    "shfmt",
    "bash-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
