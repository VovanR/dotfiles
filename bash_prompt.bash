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

# https://www.freebsd.org/cgi/man.cgi?query=termcap&apropos=0&sektion=5&manpath=FreeBSD+12.0-RELEASE+and+Ports&arch=default&format=html
# https://github.com/robbyrussell/oh-my-zsh/issues/4404

RESET="\[$(tput me)\]"
BOLD="\[$(tput md)\]"

# BLACK="\[$(tput AF 0)\]"
RED="\[$(tput AF 1)\]"
GREEN="\[$(tput AF 2)\]"
YELLOW="\[$(tput AF 3)\]"
# BLUE="\[$(tput AF 4)\]"
# MAGENTA="\[$(tput AF 5)\]"
CYAN="\[$(tput AF 6)\]"
# WHITE="\[$(tput AF 7)\]"

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
        /^Changes not staged for commit:$/ {r=r "!"}\
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

# Git whoami
PS1+=" ${YELLOW}\$(prompt_git_whoami)"

# Git stash
PS1+="\$(prompt_git_stash)"

# Newline
PS1+="${RESET}\$(echo_new_line)"

# PROMPT
PS1+="$PROMPT "
# Reset color
PS1+="${RESET}"

# vim: syntax=sh
