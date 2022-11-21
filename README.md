# tmux-last

Tmux plugin to open the last non-empty command output in a pager.

## Installation

To install with [tpm](https://github.com/tmux-plugins/tpm), add the following to your Tmux configuration file.

```tmux
set -g @plugin 'mskelton/tmux-last'
```

## Configuration

### @tmux-last-prompt-pattern

A regex pattern to identify command separator. Required.

```tmux
set -g @tmux-last-prompt-pattern '> '
```

### @tmux-last-key

The key that should be bound to open the last command output. Defaults to `t`.

```tmux
set -g @tmux-last-key t
```

### @tmux-last-prompt-lines

The number of lines consumed by the prompt. If your prompt takes up two lines, you could set this to `2`. Defaults to `1`.

```tmux
set -g @tmux-last-prompt-lines 1
```

### @tmux-last-pager

The pager to use for the captured output. Defaults to `$PAGER`.

```tmux
set -g @tmux-last-pager 'less'
```

### @tmux-last-color

When enabled, enables colorized output by passing escape codes to the pager. To use this, you may need to update `@tmux-last-pager` so your pager command accepts escape codes.

```tmux
set -g @tmux-last-color on
set -g @tmux-last-pager 'less -r'
```
