return {
  -- {
  --   "m4xshen/hardtime.nvim",
  --   config = function()
  --     require("hardtime").setup()
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --   },
  --   event = "VeryLazy",
  -- },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWrite",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = { "VeryLazy" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    dependencies = {
      "kyoh86/climbdir.nvim",
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "configs.rustaceanvim"
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
      require("core.utils").load_mappings "crates"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup()
        end,
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  {
    "phaazon/hop.nvim",
    lazy = false,
    branch = "v2",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    config = function()
      require("diffview").setup()
    end,
  },
  -- copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end,
  },
  {
    "nvim-pack/nvim-spectre",
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "echasnovski/mini.cursorword",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.cursorword").setup()
    end,
  },
  {
    "echasnovski/mini.move",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.indentscope").setup()
    end,
  },
}
