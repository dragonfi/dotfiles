#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

PS1='[\u@\h \W]\$ '
PATH=$PATH:$HOME/.local/bin

shopt -s histappend
export HISTCONTROL="erasedups"
#export HISTCONTROL="ignoredups"

source /usr/share/git/completion/git-prompt.sh

__ps1_exit_status()
{
    EXITSTATUS="$?"
    if [[ $EXITSTATUS != 0 ]]; then
        printf "$(tput bold)$(tput setaf 1)($EXITSTATUS)$(tput sgr0)\n"
    fi
}

# BLACK 0, RED 1, GREEN 2, YELLOW 3, BLUE 4, MAGENTA 5, CYAN 6, WHITE 7
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput bold)$(tput setaf 6)\]"
BLUE="\[$(tput bold)$(tput setaf 4)\]"
YELLOW="\[$(tput bold)$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto

export PROMPT_COMMAND="__ps1_exit_status"
export PS1=$BLUE'\u@\h:'$YELLOW'\w$(__git_ps1 " (%s)") '$BLUE'[\t]\n\$ '$RESET

COLOR1="\[$(tput bold)$(tput setaf 87)\]"
COLOR2="\[$(tput bold)$(tput setaf 207)\]"
COLOR3="\[$(tput bold)$(tput setaf 15)\]"
export PS1=$COLOR1'\u'$COLOR2'@\h:'$COLOR3'\w'$COLOR2'$(__git_ps1 " (%s)") '$COLOR1'[\t]\n\$ '$RESET

