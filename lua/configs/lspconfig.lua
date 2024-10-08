-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "dockerls",
  "docker_compose_language_service",
  "ts_ls",
  "tailwindcss",
  "svelte",
  "eslint",
  "yamlls",
  "pyright",
  "nginx_language_server",
  "pbls",
  "bashls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

local workspace_dir = vim.fn.expand "~/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local lombok_path = vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls/lombok.jar"

lspconfig.jdtls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = {
    vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls/jdtls",
    "-configuration",
    "/home/isaacwassouf/.cache/jdtls/config",
    "-data",
    workspace_dir,
    "--jvm-arg=" .. string.format("-javaagent:%s", lombok_path),
    "--add-opens java.base/java.lang=ALL-UNNAMED",
  },
  filetypes = { "java" },
  root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", "mvnw", "gradlew", ".git") or vim.fn.getcwd(),
  on_init = nvlsp.on_init,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = false,
      },
    },
  },
}
