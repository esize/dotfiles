# dotfiles

Cross-platform dotfiles managed with [chezmoi](https://chezmoi.io). Targets macOS, Ubuntu Linux, and Windows.

## Fresh machine setup

### macOS / Linux

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
~/.local/bin/chezmoi init --apply https://github.com/esize/dotfiles.git
```

This will:
1. Apply all dotfiles via chezmoi
2. Run `run_once_install-packages.sh` — installs Homebrew + Brewfile (macOS) or apt packages (Linux), then runs `mise install` to get all CLI tools

### Windows

In an elevated PowerShell session:

```powershell
winget install twpayne.chezmoi
chezmoi init --apply https://github.com/esize/dotfiles.git
```

This will:
1. Apply all dotfiles including the PowerShell profile and Windows Terminal config
2. Run `run_once_install-packages.ps1` — installs apps via winget, Geist Mono Nerd Font, mise, WSL2, and applies system preferences (dark mode, file extensions, developer mode)

## What's included

| File/Dir | Purpose |
|---|---|
| `dot_config/mise/config.toml` | Cross-platform CLI tools: neovim, node, go, python, lazygit, fzf, ripgrep, etc. |
| `dot_config/zsh/` | Modular zsh config: aliases, exports, path, plugins, history, completion, theming |
| `dot_config/omp/omp.toml` | oh-my-posh theme (Catppuccin Macchiato) |
| `dot_config/nvim/` | Neovim — kickstart.nvim base with personal plugins in `lua/evan/plugins/` |
| `dot_config/tmux/tmux.conf` | tmux — prefix `C-Space`, Catppuccin Macchiato |
| `dot_config/ghostty/config` | Ghostty terminal — Geist Mono, Catppuccin Macchiato |
| `dot_config/git/config.tmpl` | Git config with SSH signing |
| `dot_config/bat/` | bat — Catppuccin Macchiato theme |
| `dot_Brewfile` | macOS: GUI apps (Ghostty, Aerospace, Raycast, Docker, etc.) |
| `Documents/PowerShell/` | Windows PowerShell 7 profile |
| `AppData/.../settings.json.tmpl` | Windows Terminal config |

## Tool philosophy

- **[mise](https://mise.jdx.dev)** manages all CLI tools and runtimes cross-platform — no nvm, no asdf
- **Homebrew** (macOS only) handles GUI apps that mise can't install
- **winget** (Windows only) handles GUI apps
- **oh-my-posh** is the prompt on all platforms including PowerShell
- **Catppuccin Macchiato** everywhere

## Day-to-day chezmoi usage

```sh
chezmoi diff                  # preview pending changes
chezmoi apply                 # apply dotfiles
chezmoi edit ~/.zshrc         # edit a managed file in $EDITOR
chezmoi re-add ~/.zshrc       # pull changes from home back into source
chezmoi update                # git pull + apply
```

## Overriding per-machine config

Machine-local overrides (e.g. a different SSH signing key) go in `~/.config/chezmoi/chezmoi.toml`:

```toml
[data]
    signingkey = "~/.ssh/id_rsa.pub"
```
