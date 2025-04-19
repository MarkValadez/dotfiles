# coloring

# --- aliases
# alias -g :B='-h 2>&1 | bat --language=help --style=plain'

# --- functions
# * Color manuals
chelp() {
  "$@" --help 2>&1 | bat --language=help --style=plain
}