# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs


# Added by Toolbox App
export PATH="$PATH:/var/home/andre/.local/share/JetBrains/Toolbox/scripts"

source ~/.config/stripe-completion.bash

# qlty
export QLTY_INSTALL="$HOME/.qlty"
export PATH=$QLTY_INSTALL/bin:$PATH
export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.3/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.3/sbin:$PATH"
