# copy

# --- aliases

alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# --- functions
# * Copy current working dir to clipboard
function cpwd() {
    pwd | tee >(pbcopy)
}

function cpf {
  [[ "$#" != 1 ]] && return 1
  local file_to_copy=$1
  cat $file_to_copy | pbcopy
}

# * (WSL) Copy from symlynked C:/Downloads -> ~/Downloads
function cpfromdl() {
    if [ -z "$1" ]; then
        echo "Usage: cpdl <file_or_folder_name>"
        return 1
    fi

    local source_path="$HOME/Downloads/$1"
    if [ ! -e "$source_path" ]; then
        echo "Error: '$1' does not exist in ~/Downloads"
        return 1
    fi

    cp -r "$source_path" .
    echo "Copied '$1' to $(pwd)"
}

# * (WSL) Copy to symlynked C:/Downloads -> ~/Downloads
function cptodl() {
    if [ -z "$1" ]; then
        echo "Usage: cptodl <file_or_folder_name>"
        return 1
    fi

    local source_path="$(pwd)/$1"
    if [ ! -e "$source_path" ]; then
        echo "Error: '$1' does not exist in $(pwd)"
        return 1
    fi

    cp -r "$source_path" "$HOME/Downloads"
    echo "Copied '$1' to $HOME/Downloads"
}

# * Copy path given by "which" command
function cpwhich() {
    if [ -z "$1" ]; then
        echo "Usage: cpwhich <command>"
        return 1
    fi

    local cmd_path=$(which "$1")
    if [ -z "$cmd_path" ]; then
        echo "Error: Command '$1' not found"
        return 1
    fi

    echo "$cmd_path" | tee >(pbcopy)
    echo "Path of '$1' copied to clipboard."
}