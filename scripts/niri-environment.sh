#!/usr/bin/env bash

set -euo pipefail

readonly action="${1:-}"

readonly -a niri_variables=(
    DISPLAY
    WAYLAND_DISPLAY
    XDG_SESSION_TYPE
    XDG_CURRENT_DESKTOP
    XDG_SESSION_DESKTOP
    NIRI_SOCKET
    XAUTHORITY
)

readonly -a stable_session_variables=(
    XDG_RUNTIME_DIR
    DBUS_SESSION_BUS_ADDRESS
)

readonly -a remote_variables=(
    SSH_CONNECTION
    SSH_CLIENT
    SSH_TTY
)

# These are tmux's former built-in update-environment entries plus the niri
# values managed here. Removing their session-level entries makes every new
# process fall back to the server-global environment.
readonly -a session_override_variables=(
    DISPLAY
    KRB5CCNAME
    MSYSTEM
    SSH_ASKPASS
    SSH_AUTH_SOCK
    SSH_AGENT_PID
    SSH_CONNECTION
    SSH_CLIENT
    SSH_TTY
    WAYLAND_DISPLAY
    WINDOWID
    XAUTHORITY
    XDG_CURRENT_DESKTOP
    XDG_RUNTIME_DIR
    XDG_SESSION_DESKTOP
    XDG_SESSION_TYPE
    DBUS_SESSION_BUS_ADDRESS
    NIRI_SOCKET
)

tmux_server_available() {
    tmux show-environment -g >/dev/null 2>&1
}

unset_global() {
    tmux set-environment -gu "$1" 2>/dev/null || true
}

clear_session_overrides() {
    local session variable
    local -a tmux_commands

    while IFS= read -r session; do
        tmux_commands=()
        for variable in "${session_override_variables[@]}"; do
            if ((${#tmux_commands[@]} > 0)); then
                tmux_commands+=(';')
            fi
            tmux_commands+=(set-environment -u -t "$session" "$variable")
        done
        tmux "${tmux_commands[@]}" 2>/dev/null || true
    done < <(tmux list-sessions -F '#{session_name}' 2>/dev/null || true)
}

import_niri_environment() {
    local manager_output name value variable
    declare -A manager_environment=()

    if ! systemctl --user is-active --quiet niri.service; then
        return 0
    fi

    manager_output=$(systemctl --user show-environment)
    while IFS='=' read -r name value; do
        manager_environment["$name"]="$value"
    done <<< "$manager_output"

    for variable in "${niri_variables[@]}" "${stable_session_variables[@]}"; do
        if [[ -n "${manager_environment[$variable]+present}" ]]; then
            tmux set-environment -g "$variable" "${manager_environment[$variable]}"
        else
            unset_global "$variable"
        fi
    done

    for variable in "${remote_variables[@]}"; do
        unset_global "$variable"
    done

    clear_session_overrides
}

remove_niri_environment() {
    local variable

    for variable in "${niri_variables[@]}" "${remote_variables[@]}"; do
        unset_global "$variable"
    done

    clear_session_overrides
}

if ! tmux_server_available; then
    exit 0
fi

case "$action" in
    set)
        import_niri_environment
        ;;
    unset)
        remove_niri_environment
        ;;
    *)
        printf 'usage: %s {set|unset}\n' "$0" >&2
        exit 2
        ;;
esac
