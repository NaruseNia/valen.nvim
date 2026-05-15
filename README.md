# valen.nvim

Neovim plugin for the [Valen](https://github.com/NaruseNia/valen-lang) programming language.

## Features

- `.vln` file type detection
- Syntax highlighting (vim regex-based)
- LSP client integration (valen-lsp)
  - Diagnostics (parse errors, type errors, naming warnings)
  - Go to definition (single-file + cross-file)
  - Completion (keywords, types, functions, methods)
  - Hover (type information, function signatures)
  - Semantic tokens

## Requirements

- Neovim >= 0.10
- `valen-lsp` binary in PATH

### Building valen-lsp

```sh
git clone https://github.com/NaruseNia/valen-lang.git
cd valen-lang
cargo build --release -p valen-lsp
# Copy target/release/valen-lsp to somewhere in your PATH
```

## Installation

### lazy.nvim

```lua
-- Zero config: LSP starts automatically when valen-lsp is in PATH
{ "NaruseNia/valen.nvim" }
```

### packer.nvim

```lua
use "NaruseNia/valen.nvim"
```

## Configuration

LSP は `valen-lsp` が PATH にあれば `.vln` ファイルを開いた時に自動起動します。カスタマイズしたい場合:

```lua
require("valen").setup({
  lsp = {
    -- Path to the valen-lsp binary (default: "valen-lsp")
    cmd = { "/path/to/valen-lsp" },
    -- Root markers for workspace detection
    root_markers = { "build.gradle", "build.gradle.kts", ".git" },
  },
})
```

## File Structure

```
valen.nvim/
├── ftdetect/valen.lua       -- .vln file type detection
├── ftplugin/valen.lua       -- indent, comment settings
├── syntax/valen.vim         -- regex-based syntax highlighting
├── queries/valen/           -- tree-sitter queries (stub)
├── lua/valen/
│   ├── init.lua             -- plugin entry point
│   └── lsp.lua              -- LSP client configuration
└── README.md
```

## License

Apache License 2.0
