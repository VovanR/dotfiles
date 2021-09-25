# Variables and for PS1 prompt
# source: http://welinux.ru/post/7293/

# Variables for convenient PS1 construction
#
# Note: Wrapping the tput output in \[ \] is recommended by the Bash man page.
# This helps Bash ignore non-printable characters so that it correctly calculates the size of the prompt.
# See: https://wiki.archlinux.org/index.php/Bash/Prompt_customization
#
# \[   Begin a sequence of non-printing characters. (like color escape sequences).
#      This allows bash to calculate word wrapping correctly.
#
# \]   End a sequence of non-printing characters.

RESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"

# BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
# BLUE="\[$(tput setaf 4)\]"
# MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
# WHITE="\[$(tput setaf 7)\]"

# Git status.
# Adapted from: https://github.com/cowboy/dotfiles/
# Source: https://github.com/miripiruni/dotfiles/
function prompt_git() {
    local status output flags
    status="$(git status 2>/dev/null)"
    [[ $? != 0 ]] && return;
    output="$(echo "$status" | awk '/# Initial commit/ {print "(init)"}')"
    [[ "$output" ]] || output="$(echo "$status" | awk '/^On branch/ {print $4}')"
    [[ "$output" ]] || output="$(git branch | perl -ne '/^\* (.*)/ && print $1')"
    flags="$(
    echo "$status" | awk 'BEGIN {r=""} \
        /^Changes to be committed:$/ {r=r "+"}\
        /^Changes not staged for commit:$/ {r=r "*"}\
        /^Untracked files:$/ {r=r "?"}\
        END {print r}'
    )"
    if [[ "$flags" ]]; then
        output="${output} ${flags}"
    fi
    echo -en " ${output}"
}

# Git whoami
# Show current directory git Username and Email (not global git config)
function prompt_git_whoami() {
    local name email
    name="$(git config --local user.name 2>/dev/null)"
    email="$(git config --local user.email 2>/dev/null)"
    [[ $? != 0 ]] && return;
    echo -en "${name} <${email}>"
}

# Git stash
function prompt_git_stash {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo -en '^'
}

# Fix Windows Bash EOL
# See: https://stackoverflow.com/a/37074809/1284255
function echo_new_line() {
  echo -e "\n "
}

# Personal colors for root
case $(id -u) in
    0)
        STARTCOLOUR=${RED};
        PROMPT="${BOLD}${RED} #";
        ;;
    *)
        STARTCOLOUR=${YELLOW};
        PROMPT="${BOLD}${GREEN} >";
        ;;
esac

# Prompt

# Time
# PS1="${CYAN}\t "

# Username
PS1="${STARTCOLOUR}\u"
# @
PS1+="${RESET}@"
# Host
PS1+="${CYAN}\h "

# Working directory
PS1+="${BOLD}${GREEN}\w"

# jobs:
PS1+="${RESET}${YELLOW} jobs:"
# The number of processes you've suspended in this shell by hitting ^Z
PS1+="${BOLD}\j${RESET}"

# Git details
PS1+="${YELLOW}\$(prompt_git)"

# Git stash
PS1+="\$(prompt_git_stash)"

# Git whoami
PS1+=" ${YELLOW}\$(prompt_git_whoami)"

# Newline
PS1+="${RESET}\$(echo_new_line)"

# PROMPT
PS1+="$PROMPT "
# Reset color
PS1+="${RESET}"

# vim: syntax=sh
