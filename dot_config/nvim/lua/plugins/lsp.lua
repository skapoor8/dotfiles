-- Language server setup, kept aligned with ~/.config/helix/languages.toml
--
--   helix                              neovim
--   -----------------------------------------------------------------
--   typescript-language-server         vtsls          (same tsserver engine)
--   gopls                              gopls
--   rust-analyzer                      rust-analyzer  (via rustaceanvim)
--   ty / ruff / jedi / pylsp           pyright + ruff (jedi opt-in below)
--
-- Servers provided by mise/bun get `mason = false` so mason doesn't install a
-- second copy that shadows the toolchain-managed one.

-- Helix uses jedi as a fallback alongside pyright-equivalents. Enabling both
-- gives duplicate completion/hover, so it is off unless you flip this.
local use_jedi = false

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Match Helix's inlay hints / diagnostics presentation.
      inlay_hints = { enabled = true },
      codelens = { enabled = true },
      servers = {
        -----------------------------------------------------------------
        -- Lua
        -----------------------------------------------------------------
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
              },
            },
          },
        },

        -----------------------------------------------------------------
        -- Go
        -----------------------------------------------------------------
        -- gopls comes from the mise shim. Keep diagnostics close to editor
        -- defaults for now: no Staticcheck and no extra LazyVim analyses.
        gopls = {
          mason = false,
          settings = {
            gopls = {
              staticcheck = false,
              analyses = {
                nilness = false,
                unusedparams = false,
                unusedwrite = false,
                useany = false,
              },
            },
          },
        },

        -----------------------------------------------------------------
        -- Python
        -----------------------------------------------------------------
        -- pyright + ruff come from mason (already installed there).
        jedi_language_server = {
          mason = false,
          enabled = use_jedi and vim.fn.executable("jedi-language-server") == 1,
        },
      },
    },
  },

  -----------------------------------------------------------------------
  -- Go
  -----------------------------------------------------------------------
  -- LazyVim's Go extra adds golangci-lint diagnostics and goimports/gofumpt
  -- formatters. Keep Go editing to gopls only so diagnostics match quieter
  -- editors like Zed/Helix.
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.go = nil
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.go = nil
    end,
  },

  -----------------------------------------------------------------------
  -- Rust
  -----------------------------------------------------------------------
  -- rustaceanvim owns rust-analyzer (not lspconfig, not mason). The mise shim
  -- resolves via the global `rust = "stable"` pin, so no extra install needed.
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        cmd = { "rust-analyzer" },
      },
    },
  },

  -----------------------------------------------------------------------
  -- Keep editor tooling available through mason, but don't let mason fetch
  -- toolchain binaries mise already manages.
  -----------------------------------------------------------------------
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return not vim.tbl_contains({ "gopls", "rust-analyzer", "golangci-lint", "goimports", "gofumpt" }, pkg)
      end, opts.ensure_installed)
      vim.list_extend(opts.ensure_installed, { "lua-language-server", "stylua" })
    end,
  },
}
