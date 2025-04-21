#!/bin/sh

if [ -z "$WSL_DISTRO_NAME" ]; then
    echo "Not running in WSL. Skipping symlinking of Windows Downloads directory."
    exit 1
fi

users_dir="/mnt/c/Users"
tmpfile=$(mktemp)
i=1

echo "Available Windows user directories:"
for dir in "$users_dir"/*/; do
    username=$(basename "$dir")
    echo "  $i) $username"
    echo "$username" >> "$tmpfile"
    i=$((i + 1))
done

total_users=$((i - 1))

while true; do
    echo
    printf "Enter the number of your Windows user directory: "
    read -r selection

    # Check if input is a valid number
    case $selection in
        ''|*[!0-9]*) echo "Please enter a valid number."; continue ;;
    esac

    # Check if selection is in range
    if [ "$selection" -ge 1 ] && [ "$selection" -le "$total_users" ]; then
        username=$(sed -n "${selection}p" "$tmpfile")
        break
    else
        echo "Selection out of range. Try again."
    fi
done

rm -f "$tmpfile"

echo
echo "You selected: $username"
printf "Create symlink from \$HOME/Downloads to /mnt/c/Users/%s/Downloads? (y/n): " "$username"
read -r yn

case "$yn" in
    [Yy]*)
        if [ -e "$HOME/Downloads" ]; then
            mv "$HOME/Downloads" "$HOME/Downloads.bak.$(date +%s)"
            echo "Existing \$HOME/Downloads moved to backup."
        fi
        ln -s "/mnt/c/Users/$username/Downloads" "$HOME/Downloads"
        echo "Symlink created: \$HOME/Downloads -> /mnt/c/Users/$username/Downloads"
        ;;
    *)
        echo "Aborted."
        ;;
esac
