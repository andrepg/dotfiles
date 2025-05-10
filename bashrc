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

bind 'set completion-ignore-case on'
alias updeck="nohup ~/OBS/UPDeck/love ~/OBS/UPDeck/UPDeck.love > nohup.log 2>&1 &"
alias sail="vendor/bin/sail"

alias start-llm="systemctl --user start ollama"
alias stop-llm="systemctl --user stop ollama"

alias wc-start="sudo waydroid container start"
alias wc-stop="sudo waydroid container stop"

alias ws-stop="waydroid session stop"

alias gitl="git log --graph --abbrev-commit --decorate --all"
alias gitls="git log --graph --oneline --decorate --all"
alias gitc="git commit -m "
alias gits="git status"
alias gita="git add"
alias gitps="git push"
alias gitpu="git pull"
alias gitf="git fetch --all"

alias sat="sail artisan test"
alias satf="sail artisan test --filter"

ELECTRON_OZONE_PLATFORM_HINT=auto

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
### bling.sh source start
test -f /usr/share/ublue-os/bling/bling.sh && source /usr/share/ublue-os/bling/bling.sh
### bling.sh source end
