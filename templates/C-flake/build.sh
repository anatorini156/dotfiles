unset PATH

PATH="$gcc/bin:$coreutils/bin"

mkdir $out
gcc $src -o "$out/main"
