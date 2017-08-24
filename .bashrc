#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias google="chromium & disown"
alias qbittorrent="qbittorrent & disown"


set -o vi



if [ -z "$DISPLAY" ] && [ -n "XDG_VTNR" ] && [ -n "XDG_VTNR" -eq 1 ]; then
	exec startx
fi
