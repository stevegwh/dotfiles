# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/forest/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dpoggi"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
 alias airvpn-start="sudo systemctl start eddie-ui.service"
 alias airvpn-stop="sudo systemctl stop eddie-ui.service"
 alias airvpn-restart="sudo systemctl restart eddie-ui.service"
 alias airvpn-status="journalctl -u eddie-ui.service -n50 -f"
 alias reboot="systemctl reboot"
 alias vi="vim"
 alias smv="mv -i"
 alias swayconf="vim /home/forest/.config/sway/config"

## ESYNC enabled by default
#export WINEESYNC=1

## GL Shader unlimited cache
# export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

## VULKAN specific
# export DXVK_DEBUG_LAYERS=0
# export DXVK_LOG_LEVEL=0
# export DXVK_HUD=devinfo,memory,fps

# Neocities
export GOPATH=$HOME/.local/go
export NEOCITIES_USER="lookatyouhacker"
export NEOCITIES_PASS=$(kwallet-query -f 'Passwords' -r 'Neocities' Passwords) > /dev/null 2>&1
export NEOCITIES_KEY="f4469faf35913fdb10e69847025145aa"
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/go/bin:$HOME/.cargo/bin
alias neocitiesup="curl -F "index.html=@index.html" "https://$NEOCITIES_USER:$NEOCITIES_PASS@neocities.org/api/upload" && neocities upload ./*"
export XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:/home/forest/.local/share/flatpak/exports/share
#export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CURRENT_DESKTOP=Unity
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=wayland
#export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1

# export QT_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export GTK_IM_MODULE=ibus
fpath+=${ZDOTDIR:-~}/.zsh_functions

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    XKB_DEFAULT_LAYOUT=us exec sway
fi
