#!/usr/bin/env bash

x=$(tmux capture-pane -p -S '-' -J -t !)
PROMPT_PATTERN=${PROMPT_PATTERN:-" ] % "}
result=$(echo "$x" | cat | sed -e "0,/$PROMPT_PATTERN/d" | sed "/$PROMPT_PATTERN/,\$d" | cat)

# Get the custom page or use the default system pager as a fallback
PAGER_CMD=${PAGER_CMD:-"$PAGER"}

echo "$result" | $PAGER_CMD
