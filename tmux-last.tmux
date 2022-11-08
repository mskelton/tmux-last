#!/usr/bin/env bash

KEY=$(tmux show-option -gqv @tmux-last-capture-key)
KEY=${KEY:-t}

PROMPT_PATTERN=$(tmux show-option -gqv @tmux-last-prompt-pattern)
PROMPT_LINES=$(tmux show-option -gqv @tmux-last-prompt-lines)
PAGER_CMD=$(tmux show-option -gqv @tmux-last-pager)

tmux bind $KEY new-window -n last-command-output -e PROMPT_PATTERN="$PROMPT_PATTERN" -e PROMPT_LINES="$PROMPT_LINES" -e PAGER_CMD="$PAGER_CMD" "~/dev/tmux-last/plugin.sh"
