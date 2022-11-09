#!/bin/bash

# Get the custom page or use the default system pager as a fallback
PAGER_CMD=${PAGER_CMD:-"$PAGER"}
PAGER_CMD=${PAGER:-less}

# Allow prompts with more than one line
PROMPT_LINES=${PROMPT_LINES:-1}

contents=$(tmux capture-pane -p -S '-' -J -t !)
result=$(
	echo "$contents" |
		tail -r |
		awk "
      BEGIN {found=false}
      {
        if (match(\$0, /$PROMPT_PATTERN/)) {
          # Finish processing when the prompt following the first non-empty
          # command is reached.
          if (found) { nextfile }
          # Skip additional prompt lines
          else { for (i=1; i < $PROMPT_LINES; i++) { getline; next } }
        } else {
          found=true
          print \$0
        }
      }
    " |
		tail -r
)

echo "$result" | $PAGER_CMD
