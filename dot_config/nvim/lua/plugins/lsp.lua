-- Language server setup, kept aligned with ~/.config/helix/languages.toml
--
--   helix                              neovim
--   -----------------------------------------------------------------
--   typescript-language-server         vtsls          (same tsserver engine)
--   gopls + golangci-lint-lsp          gopls + golangci_lint_ls
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
        -- Go
        -----------------------------------------------------------------
        -- gopls comes from the mise shim; settings are inherited from the
        -- lang.go extra (gofumpt, staticcheck, full hints, analyses).
        gopls = {
          mason = false,
        },
        -- Helix runs golangci-lint-lsp next to gopls. Only attach when the
        -- server binary is actually on PATH, otherwise nvim reports a failure
        -- on every Go buffer.
        golangci_lint_ls = {
          mason = false,
          enabled = vim.fn.executable("golangci-lint-langserver") == 1,
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
  -- Don't let mason fetch toolchain binaries mise already manages.
  -----------------------------------------------------------------------
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return not vim.tbl_contains({ "gopls", "rust-analyzer" }, pkg)
      end, opts.ensure_installed)
    end,
  },
}
