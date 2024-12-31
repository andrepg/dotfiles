# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

### bling.sh source start
test -f /usr/share/ublue-os/bluefin-cli/bling.sh && source /usr/share/ublue-os/bluefin-cli/bling.sh
### bling.sh source end

## Disable case-sensitivity on terminal auto-completion
bind 'set completion-ignore-case on'

## Custom Ollama LLM Bluefin alises
alias start-llm="systemctl --user start ollama"
alias stop-llm="systemctl --user stop ollama"

## Custom Waydroid container and session aliases
alias wc-start="sudo waydroid container start"
alias wc-stop="sudo waydroid container stop"
alias ws-stop="waydroid session stop"

## Custom git aliases
alias gitl="git log --graph --abbrev-commit --decorate --all"
alias gitls="git log --graph --oneline --decorate --all"

## Custom artisan aliases
alias sail="vendor/bin/sail"
alias sat="sail artisan test"
alias satf="sail artisan test --filter"
