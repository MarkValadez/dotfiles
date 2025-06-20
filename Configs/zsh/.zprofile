# 1) Prevent double-sourcing
[[ -n "${ZPROFILE_RUN-}" ]] && return
export ZPROFILE_RUN=1

# 2) Ensure there’s a D-Bus session
if [[ -z $DBUS_SESSION_BUS_ADDRESS ]]; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
  trap 'kill -- "$DBUS_SESSION_BUS_PID"' EXIT INT TERM
fi

# 3) Export the bus into child processes
dbus-update-activation-environment --all >/dev/null 2>&1

# 4) Start (or unlock) GNOME Keyring *and* capture its sockets
if [ -n "$DESKTOP_SESSION" ];then
  eval "$(gnome-keyring-daemon --start --components=secrets,pkcs11,ssh)"
  export SSH_AUTH_SOCK GNOME_KEYRING_CONTROL
fi
