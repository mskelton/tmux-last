#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

KEY=$(tmux show-option -gqv @tmux-last-key)
KEY=${KEY:-t}

PROMPT_PATTERN=$(tmux show-option -gqv @tmux-last-prompt-pattern)
PROMPT_LINES=$(tmux show-option -gqv @tmux-last-prompt-lines)
PAGER_CMD=$(tmux show-option -gqv @tmux-last-pager)
COLOR=$(tmux show-option -gqv @tmux-last-color)

tmux bind $KEY new-window -n last-command-output -e COLOR="$COLOR" -e PROMPT_PATTERN="$PROMPT_PATTERN" -e PROMPT_LINES="$PROMPT_LINES" -e PAGER_CMD="$PAGER_CMD" "$CURRENT_DIR/plugin.sh"
