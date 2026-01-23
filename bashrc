# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH="$HOME/.oh-my-bash"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
# OSH_THEME="lambda"
OSH_THEME="powerbash10k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
OMB_PROMPT_SHOW_PYTHON_VENV=true

# Load Brew and Atuin shell, importing history again
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(atuin init bash)"
eval "$(atuin import auto > /dev/null 2>&1 || true)"

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
  docker-compose
  brew
  git_flow
  awscli
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  aws
  fzf
  brew
  battery
  progress
  bashmarks
)

# If you want to reduce the initialization cost of the "tput" command to
# initialize color escape sequences, you can uncomment the following setting.
# This disables the use of the "tput" command, and the escape sequences are
# initialized to be the ANSI version:
#
OMB_TERM_USE_TPUT=no

source "$OSH/oh-my-bash.sh"

# Define custom path to systems and user scripts
export PATH="$PATH:$HOME/.local/bin:$HOME/.qlty/bin:$HOME/.var/app/vscode/bin"

# Set GTK preferences and window decorators
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"

export XDEBUG_SESSION=andre

# Prefer Wayland over X11
export GDK_BACKEND="wayland"
export QT_QTA_PLATFORM="wayland"
export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export SDL_VIDEO_DRIVER="wayland"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes.
[[ -f ~/.aliases ]] && source ~/.aliases

# Require bash-preexec, if installed
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

# Require .profile, if it exists
[[ -f ~/.profile ]] && source ~/.profile

# Enable Yarn completion
if [ -f  /home/linuxbrew/.linuxbrew/etc/bash_completion.d/yarn ]; then
    . /home/linuxbrew/.linuxbrew/etc/bash_completion.d/yarn
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/var/home/andre/.lmstudio/bin"
# End of LM Studio CLI section

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh";
[[ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]] && . "${___MY_VMOPTIONS_SHELL_FILE}"
