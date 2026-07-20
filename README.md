# dotfiles

Personal dev environment configs managed with [chezmoi](https://www.chezmoi.io/).

Covers: `zsh`, `bash`, `helix`, `zellij`, `ghostty`, `zed`.

## Install on a new machine

```sh
brew install chezmoi
chezmoi init --apply git@github.com:skapoor8/dotfiles.git
```

## Daily use

```sh
chezmoi edit ~/.zshrc      # edit tracked file
chezmoi apply              # apply source -> $HOME
chezmoi cd                 # cd into source repo
chezmoi re-add             # pull latest $HOME state into source
```

## Secrets

Secrets are **not** tracked. They live in `~/.zshrc.local` (mode 600), which is sourced from `.zshrc` if present:

```sh
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
```

On a new machine, create `~/.zshrc.local` by hand and populate it with tokens (`PYPI_TOKEN`, `OPENROUTER_API_KEY`, etc.).

Longer-term, migrate secrets to chezmoi templates backed by age/1Password: https://www.chezmoi.io/user-guide/password-managers/
