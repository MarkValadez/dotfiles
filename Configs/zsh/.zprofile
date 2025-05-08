# Start dbus-daemon to enable keyring
# Only on WSL and if no bus is running, start a user DBus session:
if grep -qi WSL2 /proc/version && [[ -z $DBUS_SESSION_BUS_ADDRESS ]]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
    export DBUS_SESSION_BUS_ADDRESS DBUS_SESSION_BUS_PID
fi
