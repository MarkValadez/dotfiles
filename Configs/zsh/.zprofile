# Stop if .zprofile has already run in this process‐tree
[[ -n "${ZPROFILE_RUN-}" ]] && return

# Mark if ran already
export ZPROFILE_RUN=1

# Launch a D-BUS session
dbus-update-activation-environment --all > /dev/null 2>&1
eval "$(dbus-launch --sh-syntax --exit-with-session)"
  
ensure the bus daemon dies if the shell is killed or exits
trap 'kill -- $DBUS_SESSION_BUS_PID' EXIT INT TERM

