#!/usr/bin/env bash
# ============================================================================
# session-switcher.sh - Wrapper for tmux-sessionx
# ============================================================================
# This script provides a convenient wrapper for tmux-sessionx with custom
# configuration. It can be used standalone or as a popup command.
# ============================================================================

set -euo pipefail

# Check if tmux-sessionx is available
# It might be installed via TPM or as a standalone script
if ! command -v tmux-sessionx &> /dev/null; then
    # Try to find it in TPM plugins directory
    TPM_PATH="$HOME/.tmux/plugins/tmux-sessionx/scripts/sessionx.sh"
    if [[ -x "$TPM_PATH" ]]; then
        SESSIONX_CMD="$TPM_PATH"
    else
        echo "Error: tmux-sessionx is not installed"
        echo "Install it via TPM: set -g @plugin 'omerxx/tmux-sessionx'"
        exit 1
    fi
else
    SESSIONX_CMD="tmux-sessionx"
fi

# Configuration options (can be overridden via environment variables)
SESSIONX_HEIGHT="${SESSIONX_HEIGHT:-60%}"
SESSIONX_WIDTH="${SESSIONX_WIDTH:-80%}"
SESSIONX_PREVIEW="${SESSIONX_PREVIEW:-true}"

# Run tmux-sessionx with configured options
if [[ -n "${TMUX:-}" ]]; then
    # Running inside tmux - use popup
    tmux display-popup -E \
        -w "$SESSIONX_WIDTH" \
        -h "$SESSIONX_HEIGHT" \
        "$SESSIONX_CMD"
else
    # Running outside tmux - run directly
    $SESSIONX_CMD
fi
