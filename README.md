# tmux-last

Tmux plugin to open the last non-empty command output in a pager.

## Installation

```tmux
set -g @plugin 'mskelton/tmux-last'
```

## Configuration

### @tmux-last-prompt-pattern

A regex pattern to identify command separator. Required.

```tmux
set -g @tmux-last-prompt-pattern '> '
```

### @tmux-last-command-key

Set's the key that should be bound to open the last command output. Defaults to `t`.

```tmux
set -g @tmux-last-command-key t
```

### @tmux-last-prompt-lines

The number of lines consumed by the prompt. If your prompt takes up two lines, you could set this to `2`. Defaults to `1`.

```tmux
set -g @tmux-last-prompt-lines 1
```

### @tmux-last-pager

The pager to use for the captured output. Defaults to `$PAGER`.

```tmux
set -g @tmux-last-pager less
```
