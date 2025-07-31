# python

# --- Aliases
alias pyoff="deactivate"
alias pip="uv pip"
alias py="python"
alias ipy="ipython"

# UV-specific aliases
alias uvup="uv pip compile requirements.in -o requirements.txt"
alias uvs="uv sync"
alias uvi="uv pip install"

# Python environment settings
# export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1

# --- Functions
# Enhanced virtual environment creation using UV
function mkvenv() {
    if [[ -f "requirements.txt" ]]; then
        uv venv .venv
        source .venv/bin/activate
        uv pip install -r requirements.txt
    elif [[ -f "requirements.in" ]]; then
        uv venv .venv
        source .venv/bin/activate
        uvup && uvs
    else
        uv venv .venv
        source .venv/bin/activate
        echo "Created empty virtual environment. No requirements.txt or requirements.in found."
    fi
}

function pyon() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "Already in virtual environment: $VIRTUAL_ENV"
        return 1
    fi
    
    if [ -n "$PYINTERPRETER" ]; then
        source "$PYINTERPRETER"
    elif [ -f ".venv/bin/activate" ]; then
        source .venv/bin/activate
    else
        echo "Creating new virtual environment with UV..."
        mkvenv
    fi
}

# UV helper functions
function uvnew() {
    local project_name=$1
    if [[ -z "$project_name" ]]; then
        echo "Usage: uvnew <project_name>"
        return 1
    fi
    
    mkdir -p "$project_name"
    cd "$project_name" || return 1
    touch requirements.in
    mkvenv
    echo "Created new Python project with UV virtual environment: $project_name"
}

function uvadd() {
    if [[ ! -f "requirements.in" ]]; then
        echo "No requirements.in found. Creating one..."
        touch requirements.in
    fi

    for package in "$@"; do
        # Avoid adding duplicate lines
        if ! grep -qxF "$package" requirements.in; then
            echo "$package" >> requirements.in
        else
            echo "$package already in requirements.in, skipping."
        fi
    done

    uvup && uvs
}

function uvrm() {
    if [[ ! -f "requirements.in" ]]; then
        echo "No requirements.in found."
        return 1
    fi

    for package in "$@"; do
        # Escape special characters in package name for sed
        pattern=$(printf '%s\n' "$package" | sed 's/[][\.*^$(){}?+|/]/\\&/g')
        sed -i "/^$pattern$/d" requirements.in
    done

    uvup && uvs
}

