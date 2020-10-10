# export PATH=/home/dragonfi/.local/bin:/snap/bin:$PATH

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls="ls --color=auto"

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

source /etc/bash_completion.d/git-prompt

__ps1_exit_status()
{
    EXITSTATUS="$?"
    if [[ $EXITSTATUS != 0 ]]; then
        printf "$(tput setaf 1)($EXITSTATUS)$(tput sgr0)\n"
    fi
}

# BLACK 0, RED 1, GREEN 2, YELLOW 3, BLUE 4, MAGENTA 5, CYAN 6, WHITE 7
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput bold)$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto

export PROMPT_COMMAND="__ps1_exit_status"
export PS1=$GREEN'\u@\h:'$RESET'\w$(__git_ps1 " (%s)") '$GREEN'[\t]\n\$ '$RESET
