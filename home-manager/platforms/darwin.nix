{ settings, ... }:

{
  home.homeDirectory = "/Users/${settings.username}";
  home.sessionPath = [
    "$HOME/.nexustools"
    "$HOME/Dev/ALPS/BENTO/bento4/Bento4-SDK-1-6-0-91a12e57.universal-apple-macosx/bin/"
  ];
}
