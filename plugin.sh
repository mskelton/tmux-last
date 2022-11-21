#!/bin/bash

# Get the custom page or use the default system pager as a fallback
PAGER_CMD=${PAGER_CMD:-"$PAGER"}
PAGER_CMD=${PAGER_CMD:-less}

# Allow prompts with more than one line
PROMPT_LINES=${PROMPT_LINES:-1}

# Pass escape codes if color is enabled
ESCAPE=''
if [[ "$COLOR" == 'on' ]]; then
	ESCAPE='-e'
fi

contents=$(tmux capture-pane $ESCAPE -pJ -S '-' -t !)
result=$(
	echo "$contents" |
		tail -r |
		awk "
      BEGIN {found=0}
      {
        if (match(\$0, /$PROMPT_PATTERN/)) {
          if (found != 0) { nextfile }
          else { for (i=1; i < $PROMPT_LINES; i++) { getline; next } }
        } else {
          found=1
          print \$0
        }
      }
    " |
		tail -r
)

echo "$result" | $PAGER_CMD
