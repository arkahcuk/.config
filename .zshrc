# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	sudo
	z
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# ZSH history file
HISTSIZE=800
SAVEHIST=800
HISTFILE=~/.zsh_history

# Fancy auto-complete
autoload -Uz compinit
zstyle ':completion:*' menu select=0
zmodload zsh/complist
zstyle ':completion:*' format '>>> %d'
compinit
_comp_options+=(globdots) # hidden files are included

# Keybindings section
bindkey "^[k" autosuggest-execute				# Alt+k to accept autosuggestion
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

export LD_PRELOAD=""
#export EDITOR="vim"
export PATH="$HOME/bin:/usr/lib/ccache/bin/:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:$HOME/.dotnet/tools:$PATH"

setxkbmap -layout us,cz -variant ,ucw -option grp:switch
#eval $(thefuck --alias f)

# functions
cl() {
	cd "${1:-$HOME}" && ls --color
}
rl() {
	rm "$1" && ls --color
}
jas() {
	xrandr --output eDP-1 --brightness $1
}
sa() {
	eval `ssh-agent`
	KEY=${1:-~/.ssh/gw_key}
	ssh-add $KEY
}
sz() {
	du -h --max-depth=1 "${1:-./}" | sort -rh | head -n 11
}

# alias
alias ip="ip -c"
alias path="echo $PATH | tr ':' '\n'"
alias zrc="nvim ~/.zshrc"
alias rs="redshift &"
alias btc="bluetoothctl"
alias down="nmcli device disconnect wlan0"
alias brb="i3lock -efki ~/Pictures/Wallpapers/lockscreen.png && sudo zzz -z"
alias :wq="exit"
alias mps="mplayer -nosound"
alias pip="python3 -m pip"
alias odump="objdump -d a.out"
alias token="cat ~/Documents/token"

alias gogen="echo 'E8:07:BF:04:05:F7'"
alias gl="git ll | head -n 5 | tac"
alias gs="git status"
alias keyboard="setxkbmap -layout us,cz -variant ,ucw -option grp:switch"
alias htop="btop"

alias hx="helix"
alias tb="nohup thunderbird &> ~/.temp/nohup &!"
alias ff="nohup firefox &> ~/.temp/nohup &!"
alias viv="nohup vivaldi-snapshot &> ~/.temp/nohup &!"
alias vivaldi="vivaldi-snapshot"
alias prolog="swipl"
alias phpstorm='nohup /home/lika/Mounts/D/Programs/PhpStorm-232.10072.32/bin/phpstorm.sh &> ~/.temp/nohup &!'
alias webstorm='nohup /home/lika/Programs/WebStorm-233.13135.92/bin/webstorm.sh &> ~/.temp/nohup &!'
alias pycharm='nohup /home/lika/Mounts/D/Programs/pycharm-2023.3/bin/pycharm.sh &> ~/.temp/nohup &!'
alias idea='/home/lika/Mounts/D/Programs/idea-IU-232.9921.47/bin/idea.sh &!'
alias rider='/home/lika/Mounts/D/Programs/JetBrains\ Rider-2023.3.4/bin/rider.sh &!'
alias cursor='/home/lika/Programs/cursor*.AppImage &> ~/.temp/nohup &!'
alias camera='qv4l2 &!'
alias games='nvim ~/Notes/games'

alias mountd="sudo mount -t ntfs3 /dev/sda5 ~/Mounts/D"
alias umountd="sudo umount ~/Mounts/D"
alias mounte="sudo mount /dev/sda6 ~/Mounts/E"
alias umounte="sudo umount ~/Mounts/E"

alias ok="echo 'K.'"
alias kdo="echo 'se ptal?'"
alias cool="echo 'ikr?'"

alias ls7="ls"
alias yay="paru"
alias reboot="sudo reboot"
alias shutdown="sudo poweroff"
alias poweroff="sudo poweroff"
alias c="clear"
alias cd..="cd .."
alias sl="ls --color=auto"
alias vi="vim"
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias df="df -h"                          # human-readable sizes
alias free="free -h"
alias du="du -h"
alias shred="shred -zf"

