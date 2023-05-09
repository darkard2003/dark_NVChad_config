local overrides = require "custom.configs.overrides"

local M = {
  -- lspconfig overrides
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- Nvim cmp overrides
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
      experimental = {
        ghost_text = true,
      },
    },
  },
  -- NvTerm config
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },
  -- Mason config
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  -- Project management
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup {}
      require("telescope").load_extension "projects"
      require("nvim-tree").setup {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
      }
    end,
  },
  -- Cpoilot completion
  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    dependencies = {
      -- Copilot lua
      {
        "zbirenbaum/copilot.lua",
        config = function()
          require("copilot").setup {
            suggestion = { enabled = false },
            panel = { enabled = false },
          }
        end,
      },
    },
    config = function()
      require("copilot_cmp").setup {
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing,
        },
      }
    end,
  },

  -- AutoSave
  {
    "sar/AutoSave.nvim",
    config = function()
      require("autosave").setup {
        enabled = false,
      }
    end,
    cmd = { "ASToggle", "ASOn", "ASOff" },
  },
}

return M
