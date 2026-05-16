# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A [chezmoi](https://chezmoi.io)-managed dotfiles repo targeting **macOS**, **Ubuntu Linux**, and **Windows**. Files follow chezmoi source state naming conventions (`dot_` prefix, `.tmpl` suffix for templates).

## Chezmoi Conventions

- `dot_foo` → `~/.foo`
- `dot_config/bar` → `~/.config/bar`
- `foo.tmpl` → template processed before writing (strips `.tmpl` suffix)
- `run_once_foo.sh` → runs once on first `chezmoi apply`
- `private_foo` → written with mode 0600

Template variables from `.chezmoi.toml.tmpl`:
- `{{ .name }}` — "Evan"
- `{{ .email }}` — evan.dayton.sizemore@gmail.com
- `{{ .chezmoi.os }}` — "darwin", "linux", or "windows"

Platform filtering is in `.chezmoiignore.tmpl`.

## Key Commands

```sh
chezmoi diff                    # preview what would change
chezmoi apply                   # apply dotfiles to home directory
chezmoi apply --dry-run -v      # dry run with verbose output
chezmoi cd                      # cd into source directory
chezmoi edit ~/.zshrc           # edit a managed file
chezmoi re-add ~/.zshrc         # pull changes from home back into source
chezmoi update                  # pull latest from git + apply
```

## Structure

```
dotfiles/
├── .chezmoi.toml.tmpl          # config: name, email, diff pager
├── .chezmoiignore.tmpl         # platform filtering
├── dot_zshrc.tmpl              # sources ~/.config/zsh/*.zsh
├── dot_Brewfile                # Mac: GUI apps + mise (CLI tools excluded)
├── dot_config/
│   ├── mise/config.toml        # cross-platform CLI tools (neovim, node, go, etc.)
│   ├── zsh/                    # modular zsh config (aliases, exports, path, etc.)
│   ├── omp/omp.toml            # oh-my-posh theme (Catppuccin Macchiato)
│   ├── nvim/                   # kickstart.nvim + lua/evan/plugins/
│   ├── git/config.tmpl         # git config with template vars
│   ├── tmux/tmux.conf          # prefix=C-Space, catppuccin-macchiato
│   ├── bat/                    # bat theme + syntax (Catppuccin Macchiato)
│   └── ghostty/config          # terminal: Geist Mono 13, catppuccin-macchiato
├── run_once_install-packages.sh.tmpl   # Mac (brew bundle + mise) / Linux (apt + mise)
├── run_once_install-packages.ps1.tmpl  # Windows (winget + mise + system prefs)
├── Documents/PowerShell/
│   └── Microsoft.PowerShell_profile.ps1.tmpl  # Windows PowerShell 7 profile
└── AppData/Local/Packages/.../LocalState/
    └── settings.json.tmpl      # Windows Terminal: font + Catppuccin Macchiato
```

## Tool Philosophy

- **mise** manages all CLI tools cross-platform (neovim, node, go, python, lazygit, ripgrep, fzf, etc.)
- **Homebrew** (Mac only) handles GUI apps that mise cannot: Ghostty, Aerospace, Raycast, Docker Desktop, etc.
- **winget** (Windows only) handles GUI apps
- **oh-my-posh** is the prompt on all platforms (including PowerShell)
- **Catppuccin Macchiato** is the color scheme everywhere (neovim, tmux, bat, ghostty, Windows Terminal)

## Neovim

Config is kickstart.nvim-based at `dot_config/nvim/`. Personal plugins live in `lua/evan/plugins/init.lua`. Mason handles LSP/formatter installation automatically on first launch.

## Adding a New File

```sh
chezmoi add ~/.config/foo/config
# or for a template:
chezmoi add --template ~/.config/foo/config
```

## Fresh Machine Setup

**Mac/Linux:**
```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
~/.local/bin/chezmoi init --apply https://github.com/esize/dotfiles.git
```

**Windows (PowerShell Admin):**
```powershell
winget install twpayne.chezmoi
chezmoi init --apply https://github.com/esize/dotfiles.git
```
