export PATH="${gcc}/bin:${coreutils}/bin:${findutils}/bin"

sources=$(find "$src/" -iname "*.c")

mkdir $out
gcc -o $out/hello $sources
