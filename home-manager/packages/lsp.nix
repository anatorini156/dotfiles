{ pkgs,...} :
with pkgs; [
    lua-language-server
    nil # Nix language server
    nixfmt-rfc-style # Nix formatter
]
