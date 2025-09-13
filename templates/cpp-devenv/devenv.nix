{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages = [
  pkgs.gdb
  pkgs.cmake
  ];

  env = {
    DEV_SHELL = "cpp";
  };

  scripts = {
    configure = {
      exec = ''
        mkdir -p build/release
        mkdir -p build/debug

        cmake -S $PROJECT_ROOT -B build/release -DCMAKE_BUILD_TYPE=Release
        cmake -S $PROJECT_ROOT -B build/debug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=yes
        ln -s build/debug/compile_commands.json .

      '';
    };

    build = {
      exec = ''
        cd "build/$1"
        cmake --build . 
      '';
    };

    run = {
      exec = ''
        cd "build/$1"
        ./main $@
      '';
    };
    debug = {
      exec = ''
        cd build/debug
        gdb --args main $@
      '';
      };
    clean = {
      exec = ''
      read -p "Are you sure? " -n 1 -r
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
          rm -fr $PROJECT_ROOT/build
      fi
      '';
      };
  };

  enterShell = ''
    export PROJECT_ROOT=$(pwd)
    exec zsh
  '';

  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';
}
