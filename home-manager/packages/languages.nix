{ pkgs,python_pkgs, ... }:
with pkgs;
[
  lua
  lua-language-server
  stylua

  nil 
  nixfmt-rfc-style # Nix formatter

  nodejs_24
  typescript
  typescript-language-server
  
  pyright
  black

  clang-tools
  cmake
  cmake-language-server

  vscode-langservers-extracted

  yaml-language-server

  zig
  zls

  kotlin-language-server
  gradle
  kotlin
 
  java-language-server
  maven

  cargo

  bash-language-server

  go
  android-tools
]
