# JCSolutions Neovim Config

My personal Neovim configuration for Linux and Termux, focused on a clean appearance, productivity, and a practical coding experience.

## Features

- Tokyo Night theme
- File explorer, fuzzy finder, statusline, and bufferline
- Git signs and indentation guides
- Treesitter syntax highlighting
- LSP support and completion
- Formatting on save when the relevant formatter is installed
- Shared configuration intended for Linux and Termux

## Requirements

- Neovim 0.11 or newer recommended
- Git
- A C compiler and build tools for plugins that need native compilation
- Node.js for JavaScript/TypeScript language tooling
- Language-specific runtimes and formatters as needed

On Debian/Ubuntu-based Linux distributions, a starting point is:

```bash
sudo apt update
sudo apt install git build-essential ripgrep fd-find nodejs npm
```

On Termux:

```bash
pkg update
pkg install git clang ripgrep fd
```

Package names can vary by distribution. Some language servers and formatters require additional setup.

## Installation

Back up any existing configuration first:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

Clone this repository:

```bash
git clone <repository-url> ~/.config/nvim
```

Then start Neovim:

```bash
nvim
```

The first launch bootstraps `lazy.nvim` and installs the configured plugins. Allow the initial installation to finish, then restart Neovim.

Replace `<repository-url>` with the actual GitHub repository URL.

## Language servers

The configuration requests these language servers through Mason:

- Bash
- CSS
- HTML
- Intelephense (PHP)
- JSON
- Pyright (Python)
- TypeScript/JavaScript

On desktop Linux, it also requests `clangd` for C/C++.

On Termux, install C/C++ tooling through Termux instead:

```bash
pkg install clang
```

LuaLS is intentionally not configured.

Some language servers require project dependencies or runtime tools to work correctly. Open a project directory, rather than an isolated file, for the best results.

## Formatters

Formatting on save is configured for supported file types when the formatter is available:

- JavaScript / TypeScript / JSON / CSS / HTML / Markdown: Prettier
- Lua: StyLua
- Python: Black
- PHP: PHP-CS-Fixer

Install the formatter you need using your preferred package manager. If a formatter is not installed, formatting may fall back to an available LSP formatter.

## Useful shortcuts

The leader key is `Space`.

| Shortcut | Action |
|---|---|
| `Space e` | Toggle file explorer |
| `Space ff` | Find files |
| `Space fg` | Search text in project (requires `ripgrep`) |
| `Space fb` | Find open buffers |
| `Space fh` | Search Neovim help |
| `Space w` | Save file |
| `Space q` | Quit window |
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Show hover documentation |
| `Space rn` | Rename symbol |
| `Space ca` | Code action |
| `Space f` | Format file |
| `Space d` | Show diagnostic |

## Troubleshooting

- `:Lazy` opens the plugin manager.
- `:Mason` opens the language-server installer.
- `:checkhealth` helps diagnose Neovim and plugin issues.
- `:ConformInfo` shows formatter status.
- If a plugin fails to compile on Termux, check its requirements and install the corresponding Termux package.

This is a personal configuration, so adjust the plugin list and language servers to match your workflow.

## License

MIT
