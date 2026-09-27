# dotfiles

Personal development environment managed with [chezmoi](https://www.chezmoi.io/).

## Managed configuration

- Shell: zsh and bash
- Terminals/editors: Ghostty, Helix, Neovim, Zed, Zellij
- CLI/UI tools: Glow, Yazi, Mise
- Pi: safe settings and the `vercel-dark` theme only
- Helix: configuration, theme, languages, and runtime highlight-query overrides

Downloaded tools, caches, sessions, histories, credentials, and package checkouts are intentionally excluded.

## Install on a new machine

Install Git, chezmoi, and Mise first. On macOS:

```sh
brew install chezmoi mise
```

Initialize the source repository without immediately overwriting live files:

```sh
chezmoi init git@github.com:skapoor8/dotfiles.git
chezmoi diff
chezmoi apply
```

`chezmoi apply` runs managed `run_onchange_` scripts that:

1. Run `mise install` for globally declared tools.
2. Run `ya pkg install` for Yazi plugins.

Open Neovim after setup; its managed `lazy-lock.json` pins plugin revisions and Lazy will install missing plugins.

## Daily synchronization

Global Mise tasks provide review-first synchronization from any directory:

```sh
mise run dotfiles:push
mise run dotfiles:pull
```

### Push

`dotfiles:push`:

1. Refuses to run if the chezmoi source repository is already dirty.
2. Re-adds an explicit allowlist of managed live configuration.
3. Shows Git status, a diff summary, and the full diff.
4. Prompts before committing and pushing.

### Pull

`dotfiles:pull`:

1. Refuses to run if the source repository is dirty.
2. Pulls with rebase.
3. Shows the source-to-live diff.
4. Prompts before applying changes to the machine.

Useful manual commands:

```sh
chezmoi status                    # source/live state summary
chezmoi diff                      # inspect what apply would change
chezmoi managed                   # list managed destination paths
chezmoi add ~/.config/tool/file   # enroll a new file
chezmoi re-add ~/.config/tool     # capture live edits to managed files
chezmoi apply                     # render source state into $HOME
chezmoi cd                        # open a shell in this repository
```

## Where configuration lives

- Live application files: `$HOME`, for example `~/.config/helix/config.toml`.
- Git-backed chezmoi source: `~/.local/share/chezmoi`.
- Machine-local chezmoi behavior: `~/.config/chezmoi/chezmoi.toml`.
- Repository behavior: special files in this repository, including `.chezmoiignore`, `.chezmoiexternal.*`, `.chezmoidata.*`, and `run_*` scripts.

The source tree itself is the managed-file manifest; there is no separate allowlist file. The stricter list captured by `dotfiles:push` lives in the global Mise task.

## Secrets and local state

Secrets are not tracked. Shell secrets belong in `~/.zshrc.local` (mode `600`), which `.zshrc` sources when present:

```sh
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
```

Pi authentication, sessions, run history, trust state, caches, MCP onboarding state, and model caches are excluded. Only these Pi files are managed:

```text
~/.pi/agent/settings.json
~/.pi/agent/themes/vercel-dark.json
```

For shared secrets, prefer chezmoi templates backed by age or a password manager rather than plaintext Git files.
