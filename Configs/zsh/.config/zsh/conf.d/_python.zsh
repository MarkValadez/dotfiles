# python

# --- Aliases

alias pyoff="deactivate"
alias pip="uv pip"

# --- Functions

function pyon() {
    if [ -n "$PYINTERPRETER" ]; then
        # If PYINTERPRETER is set, source it
        source "$PYINTERPRETER"
    elif [ -f ".venv/bin/activate" ]; then
        # If PYINTERPRETER is not set, but .venv exists, source it
        source .venv/bin/activate
    else
        # Otherwise, display an error message
        echo "Error: Virtual environment not found. Set PYINTERPRETER or ensure .venv exists."
    fi
}