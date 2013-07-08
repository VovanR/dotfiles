# If running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi



####################
# Global Variables #
####################
export GIT_EDITOR='nano'



########
# Path #
########
# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi



##########
# Locale #
##########
# export LANG="ru_RU.UTF-8"
# export LANGUAGE="en"
# LC_CTYPE="ru_RU.UTF-8"
# LC_NUMERIC=ru_RU.UTF-8
# LC_TIME=ru_RU.UTF-8
# LC_COLLATE="ru_RU.UTF-8"
# LC_MONETARY=ru_RU.UTF-8
# LC_MESSAGES="ru_RU.UTF-8"
# LC_PAPER=ru_RU.UTF-8
# LC_NAME=ru_RU.UTF-8
# LC_ADDRESS=ru_RU.UTF-8
# LC_TELEPHONE=ru_RU.UTF-8
# LC_MEASUREMENT=ru_RU.UTF-8
# LC_IDENTIFICATION=ru_RU.UTF-8
# LC_ALL=


# Variables and for PS1 prompt
# source: http://welinux.ru/post/7293/

# Variables for convenient PS1 construction 
#
# Управляющие последовательности заключены в скобки "\[" и "\]"
# для того, чтобы shell не учитывал их при оценке длины строки.
# В противном случае длинные строки будут переноситься неверно.
#
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
bakgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Git status.
# Adapted from: https://github.com/cowboy/dotfiles/
# Source: https://github.com/miripiruni/dotfiles/
function prompt_git() {
    local status output flags
    status="$(git status 2>/dev/null)"
    [[ $? != 0 ]] && return;
    output="$(echo "$status" | awk '/# Initial commit/ {print "(init)"}')"
    [[ "$output" ]] || output="$(echo "$status" | awk '/# On branch/ {print $4}')"
    [[ "$output" ]] || output="$(git branch | perl -ne '/^\* (.*)/ && print $1')"
    flags="$(
    echo "$status" | awk 'BEGIN {r=""} \
        /^# Changes to be committed:$/ {r=r "+"}\
        /^# Changes not staged for commit:$/ {r=r "!"}\
        /^# Untracked files:$/ {r=r "?"}\
        END {print r}'
    )"
    if [[ "$flags" ]]; then
        output="$output[$flags]"
    fi
    echo -en '\033[00;33m'"; on "'\033[01;33m'$output
}

# Personal colors for root
case $(id -u) in
    0)
        STARTCOLOUR=$txtred;
        PROMPT="$bldred #";
        ;;
    *)
        STARTCOLOUR=$txtylw;
        PROMPT="$bldgrn >";
        ;;
esac

# Prompt
# PS1="$bldgrn[\u@\h \w]\$ $txtrst"
PS1="$STARTCOLOUR\u" # Username
PS1+="$txtrst@" # @
PS1+="$txtcyn\h " # Host
PS1+="$bldgrn\w" # Working directory

PS1+="$txtylw jobs:" # jobs:
PS1+="$bldylw\j" # The number of processes you've suspended in this shell by hitting ^Z

PS1+="\$(prompt_git)" # Git details

PS1+="$txtrst\n" # Newline
PS1+="$PROMPT " # PROMPT
PS1+="$txtrst" # Reset color

# color in different utilitties by default
alias ls='ls --color=auto'
alias grep='grep --color=auto'
eval `dircolors -b`

# color in man
export LESS_TERMCAP_mb=$'\033[01;36m'
export LESS_TERMCAP_md=$'\033[01;32m'
export LESS_TERMCAP_me=$'\033[0m'
export LESS_TERMCAP_mu=$'\033[01;37m'
export LESS_TERMCAP_se=$'\033[0m'
export LESS_TERMCAP_so=$'\033[01;44;33m'
export LESS_TERMCAP_ue=$'\033[0m'
export LESS_TERMCAP_us=$'\033[01;36m'

# Variable to use colorful MC and VIM
export TERM=xterm-256color

export EDITOR=/usr/bin/nano

echo `uname -a`
echo `date`
