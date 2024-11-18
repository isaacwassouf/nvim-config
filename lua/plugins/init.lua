return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "json",
        "scss",
        "yaml",
        "dockerfile",
        "bash",
        "python",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "svelte",
        "java",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>gnn",
          node_incremental = "<leader>grn",
          scope_incremental = "<leader>grc",
          node_decremental = "<leader>grm",
        },
      },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>tr",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tR",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- {
  --   "Wansmer/symbol-usage.nvim",
  --   event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
  --   config = function()
  --     require("symbol-usage").setup()
  --   end,
  -- },

  {
    "mbbill/undotree",
    lazy = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local defaultConfig = require "nvchad.configs.nvimtree"
      require("nvim-tree").setup(vim.tbl_deep_extend("force", defaultConfig, {
        git = {
          enable = true,
          ignore = false,
        },
        filters = {
          dotfiles = false,
        },
      }))
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    config = function()
      local defaultConfig = require "nvchad.configs.gitsigns"
      require("gitsigns").setup(vim.tbl_extend("force", defaultConfig, {
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
      }))
    end,
  },

  -- {
  --   "mfussenegger/nvim-jdtls",
  --   ft = { "java" },
  --   config = function()
  --     local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  --     local workspace_dir = vim.fn.expand "~/.cache/jdtls/workspace/" .. project_name
  --     local lombok_path = vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls/lombok.jar"
  --
  --     local config = {
  --       cmd = {
  --         vim.fn.expand "~/.local/share/nvim/mason/bin/jdtls",
  --         "--jvm-arg=" .. string.format("-javaagent:%s", lombok_path),
  --       },
  --       -- root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  --
  --       -- The command that starts the language server
  --       -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  --       -- cmd = {
  --       --
  --       --   -- 💀
  --       --   "/usr/lib/jvm/jdk-22.0.2-oracle-x64/bin", -- or '/path/to/java17_or_newer/bin/java'
  --       --   -- depends on if `java` is in your $PATH env variable and if it points to the right version.
  --       --
  --       --   "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  --       --   "-Dosgi.bundles.defaultStartLevel=4",
  --       --   "-Declipse.product=org.eclipse.jdt.ls.core.product",
  --       --   "-Dlog.protocol=true",
  --       --   "-Dlog.level=ALL",
  --       --   "-Xmx1g",
  --       --   "--add-modules=ALL-SYSTEM",
  --       --   "--add-opens",
  --       --   "java.base/java.util=ALL-UNNAMED",
  --       --   "--add-opens",
  --       --   "java.base/java.lang=ALL-UNNAMED",
  --       --
  --       --   -- 💀
  --       --   "-jar",
  --       --   "/home/isaacwassouf/.local/share/nvim/mason/packages/jdtls/jdtls",
  --       --   -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
  --       --   -- Must point to the                                                     Change this to
  --       --   -- eclipse.jdt.ls installation                                           the actual version
  --       --
  --       --   -- 💀
  --       --   "-configuration",
  --       --   "/home/isaacwassouf/.local/share/nvim/mason/packages/jdtls/config_linux",
  --       --   -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
  --       --   -- Must point to the                      Change to one of `linux`, `win` or `mac`
  --       --   -- eclipse.jdt.ls installation            Depending on your system.
  --       --   --
  --       --   --
  --       --   "-javaagent:" .. lombok_path,
  --       --
  --       --   -- 💀
  --       --   -- See `data directory configuration` section in the README
  --       --   "-data",
  --       --   workspace_dir,
  --       -- },
  --
  --       -- 💀
  --       -- This is the default if not provided, you can remove it. Or adjust as needed.
  --       -- One dedicated LSP server & client will be started per unique root_dir
  --       root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },
  --
  --       -- Here you can configure eclipse.jdt.ls specific settings
  --       -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  --       -- for a list of options
  --       settings = {
  --         java = {},
  --       },
  --
  --       -- Language server `initializationOptions`
  --       -- You need to extend the `bundles` with paths to jar files
  --       -- if you want to use additional eclipse.jdt.ls plugins.
  --       --
  --       -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --       --
  --       -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  --       init_options = {
  --         bundles = {},
  --       },
  --     }
  --     -- This starts a new client & server,
  --     -- or attaches to an existing client & server depending on the `root_dir`.
  --     require("jdtls").start_or_attach(config)
  --   end,
  -- },
  --
  --
  --
}
