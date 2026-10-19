#!/usr/bin/env bash
# session_preview.sh - Preview session content for fzf

selected="$1"
session=$(printf '%s\n' "$selected" | cut -f2)

if [[ "$session" =~ ^\$[0-9]+$ ]]; then
    # Resolve the display name, but use the ID for every target.
    session_name=$(tmux display-message -t "$session" -p '#{session_name}' 2>/dev/null) || exit 0
    # Get session info header
    windows=$(tmux list-windows -t "$session" 2>/dev/null | wc -l)
    attached=$(tmux display-message -t "$session" -p '#{?session_attached,attached,detached}' 2>/dev/null)

    printf "#[bold]%s#[nobold] (%d windows, %s)\n\n" "$session_name" "$windows" "$attached"

    # List windows in this session
    tmux list-windows -t "$session" -F '#{window_index}: #{window_name} (#{window_panes} panes)' 2>/dev/null | \
        while read -r window_info; do
            printf "  %s\n" "$window_info"
        done

    printf "\n"

    # Get first window for content preview
    first_window=$(tmux list-windows -t "$session" -F '#{window_index}' 2>/dev/null | head -1)
    if [[ -n "$first_window" ]]; then
        tmux capture-pane -t "${session}:${first_window}" -p -S -25 2>/dev/null | head -30
    fi
else
    echo "No session selected"
fi
