# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/denlillemand/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerline"

export KEYTIMEOUT=1

#colors
if [[ $TERM != "xterm-256color" ]] || [[ $TERM != "screen-256color" ]] || [[ $TERM != "screen" ]] #attempt at fixing tmux nvim colors
then 
    export TERM="xterm-256color"
fi

set t_Co=256

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump git vi-mode fzf aws archlinux ssh-agent systemd docker gpg-agent github postgres wd powerline command-time django)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

#golang
export GO_HOME="/usr/lib/go"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GO_HOME/bin

export PATH=$PATH:$HOME/intellij/goland/bin
export PATH=$PATH:$HOME/phpstorm/bin
export PATH=$PATH:$HOME/.local/bin

#Pagers
export PAGER='vim -R -u ~/.vimrcpg -'
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
export LESS=eFRX
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
export PSQL_EDITOR=/usr/bin/vim 


#figlet & neofetch
#Print out cool stuff
#my .neofetch file should be found in github.com/denlillemand/ubuntu_configurations/neofetch/neofetch
#neofetch --config /home/denlillemand/.neofetch --ascii_distro Arch Linu
if [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; then
# neofetch --ascii_distro Arch Linu  #Doesn't work unfortunately, tmux doesn't understand when its scripted. :( 
    echo ""
else
    neofetch --config /home/denlillemand/.config/neofetch/neofetch.conf 
    figlet DenLilleMand
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ls="exa"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias cat="bat --pager LESS"
alias chromium="chromium & disown"
alias rider="rider.sh & disown"
#alias curl="httpie"
#alias psql="pgcli"
export FZF_BASE=/home/denlillemand/.oh-my-zsh/custom/plugins/fzf/

# append to history, don't overwrite it

HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
#setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

echo "Remember:\n"
echo "use ff, errt, :, fl, i, v, c, fum, fun, for, inf, terf, terr \n" 
echo "use ctrl+b, ctrl+w"

export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config-omnio.yml

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="/home/denlillemand/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/denlillemand/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/denlillemand/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/denlillemand/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/denlillemand/perl5"; export PERL_MM_OPT;

export PATH="$HOME/IDE/rider/bin/:$PATH"
export PATH="$HOME/IDE/community/bin/:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export DJANGO_SETTINGS_MODULE="omnio_db.settings_local"
export JAVA_HOME="/usr/lib/jvm/java-12-openjdk"
export FLAMEGRAPH_DIR="/home/denlillemand/FlameGraph"
export WORKON_HOME=~/envs
source $HOME/.cargo/env
