#!/bin/bash

RESET="\[\033[0m\]"
RED="\[\033[1;31m\]"
CYAN="\[\033[1;36m\]"
GREEN="\[\033[1;32m\]"
BLUE="\[\033[1;34m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
 
PS_LINE=`printf -- '- %.0s' {1..200}`
function parse_git_branch {
  PS_BRANCH=''
  PS_FILL=${PS_LINE:0:$COLUMNS}
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  PS_BRANCH="(${ref#refs/heads/}) "
}
PROMPT_COMMAND=parse_git_branch
PS_INFO="$CYAN\u@\h$RESET:$GREEN\w"
PS_GIT="$YELLOW\$PS_BRANCH"
PS_TIME="\[\033[\$((COLUMNS-10))G\] $RED[\t]"

BASH_STATUS='`if [ $? = 0 ]; then echo "\$"; else echo "\[\033[01;31m\]\$"; fi`'
PS1="\n\${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_GIT}${PS_TIME}\n${WHITE}${BASH_STATUS}${RESET} "

# Quickly find out external IP address for your device by typing 'xip'
xip() {
    echo
    if [ -z "$1" ]; then
        curl -s ipinfo.io
    else
        curl -s ipinfo.io/"$1"
    fi
    echo
}

# Quickly check weather for your city right inside the terminal by typing 'weather'
# Remove 'm' from the url to use Fahrenheit instead of Celsius
weather() {
    if [ -z "$1" ]; then
        echo
        curl -s wttr.in/?2mqF
    else
        echo
        curl -s wttr.in/"$1"?2mqF
    fi
}