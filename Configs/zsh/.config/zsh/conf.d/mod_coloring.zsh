# coloring

# --- functions
# * Color manuals
chelp() {
  "$@" --help 2>&1 | bat --language=help --style=plain
}