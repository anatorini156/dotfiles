idf () {
  if [ -z "$IDF_LOADED" ]; then
    source /home/anatorini/.local/bin/esp32-idf/export.sh
    export IDF_LOADED=1
  fi
}
alias esp32="idf.py"
