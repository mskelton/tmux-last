#!/usr/bin/env bash

KEY=$(tmux show-option -gqv @tmux-last-capture-key)
KEY=${KEY:-t}

PROMPT_PATTERN=$(tmux show-option -gqv @tmux-last-prompt-pattern)
PAGER_CMD=$(tmux show-option -gqv @tmux-last-pager)

tmux bind $KEY new-window -n last-command-output -e PROMPT_PATTERN="$PROMPT_PATTERN" -e PAGER_CMD="$PAGER_CMD" "$(pwd)/plugin.sh"
