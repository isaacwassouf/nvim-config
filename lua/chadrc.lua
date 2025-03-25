-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "block",
  },
  cmp = {
    format_colors = {
      tailwind = true,
    },
  },
}

M.base46 = {
  theme = "nightfox",
  transparency = true,

  hl_override = {
    CursorLine = { bg = "one_bg2" },
    -- Comment = { italic = true },
    -- ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
}

M.mason = {
  pkgs = {
    "lua-language-server",
    "gopls",
    "typescript-language-server",
    "tailwindcss-language-server",
    "svelte-language-server",
    "eslint-lsp",
    "dockerfile-language-server",
    "docker-compose-language-service",
    "yaml-language-server",
    "pyright",
    "prettier",
    "black",
    "gofumpt",
    "goimports-reviser",
    "golines",
    "nginx-language-server",
    "pbls",
    "bash-language-server"
  },
}

return M
