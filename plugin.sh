#!/bin/bash

# Get the custom page or use the default system pager as a fallback
PAGER_CMD=${PAGER_CMD:-"$PAGER"}
PAGER_CMD=${PAGER:-less}

PROMPT_PATTERN=${PROMPT_PATTERN:-"\$"}
PROMPT_LINES=${PROMPT_LINES:-1}

# TODO: Rewrite this to be faster
function get_last_non_empty_output {
	found_output=0

	while IFS='' read line; do
		if [[ "$line" =~ $PROMPT_PATTERN ]]; then
			# Once we found non-empty output, exit earily to finish
			if [[ $found_output == 1 ]]; then
				return
			fi

			# Consume and discard additional prompt lines
			for ((i = 1; i < $PROMPT_LINES; i += 1)); do read; done
		else
			found_output=1
			echo "$line"
		fi
	done
}

contents=$(tmux capture-pane -p -S '-' -J -t !)
result=$(echo "$contents" | tail -r | get_last_non_empty_output | tail -r)

echo "$result" | $PAGER_CMD
