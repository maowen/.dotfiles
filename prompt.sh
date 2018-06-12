#!/bin/bash

# Adapted from from https://github.com/hoelzro/bashrc/blo...

function __prompt
{
# List of color variables that bash can use
local BLACK="\[\033[0;30m\]" # Black
local DGREY="\[\033[1;30m\]" # Dark Gray
local RED="\[\033[0;31m\]" # Red
local LRED="\[\033[1;31m\]" # Light Red
local GREEN="\[\033[0;32m\]" # Green
local LGREEN="\[\033[1;32m\]" # Light Green
local BROWN="\[\033[0;33m\]" # Brown
local YELLOW="\[\033[1;33m\]" # Yellow
local BLUE="\[\033[0;34m\]" # Blue
local LBLUE="\[\033[1;34m\]" # Light Blue
local PURPLE="\[\033[0;35m\]" # Purple
local LPURPLE="\[\033[1;35m\]" # Light Purple
local CYAN="\[\033[0;36m\]" # Cyan
local LCYAN="\[\033[1;36m\]" # Light Cyan
local LGREY="\[\033[0;37m\]" # Light Gray
local WHITE="\[\033[1;37m\]" # White

local RESET="\[\033[0m\]" # Color reset
local BOLD="\[\033[;1m\]" # Bold


local dirty
local branch
local vcs_info

# Look for Git status
if git status &>/dev/null; then
if git status -uno -s | grep -q . ; then
dirty=1
fi
branch=$(git branch --color=never | sed -ne 's/* //p')

# Look for Subversion status
elif svn info &>/dev/null ;  then
dirty=$(svn status -q)
wcroot=$(svn info | grep 'Working Copy Root Path:' | grep -o "/.*$")
branch=$(svn info $wcroot | grep '^URL:' | grep -o '[^/]*$')

fi

if [[ ! -z "$branch" ]]; then
local status_color
if [[ -z "$dirty" ]] ; then
status_color=$LGREEN
else
status_color=$YELLOW
fi
vcs_info="$LCYAN($BOLD$status_color$branch$LCYAN)"
fi

PS1="${debian_chroot:+($debian_chroot)}$LGREEN\h$LBLUE \w ${vcs_info}$LBLUE\$$RESET "
}


if [[ -z "$PROMPT_COMMAND" ]]; then
PROMPT_COMMAND=__prompt
else
PROMPT_COMMAND="$PROMPT_COMMAND ; __prompt"
fi
__prompt
