{ pkgs, ... }:
with pkgs;
[
  lua
  lua-language-server
  stylua

  nil # Nix language server
  nixfmt-rfc-style # Nix formatter

  nodejs_24
  typescript
  typescript-language-server

  python312
  pyright
  black

  clang-tools
  cmake

  vscode-langservers-extracted # LSP for css,html,json,md

  yaml-language-server

  zig
  zls

  kotlin-language-server

]
