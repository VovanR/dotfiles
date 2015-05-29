# Inspired by:
# https://github.com/sapegin/dotfiles
# https://github.com/miripiruni/dotfiles
# https://github.com/dreadatour/dotfiles
# https://github.com/paulirish/dotfiles
# https://github.com/addyosmani/dotfiles


# Aliases #
###########

# Prompt before overwrite
alias cp='cp -i'
alias rm='rm -I'
alias mv='mv -i'
alias ln='ln -i'

# Some more ls aliases
alias ll='ls -lahF'
alias la='ls -AhF'
alias l='ls -CF'

# tree aliaces
alias tree='tree --dirsfirst'

# Easier navigation
alias ..="cd ..;" # .. .. ..
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -" # The alias is `-`, not `--`

# Helpers
alias fndf="sudo find ./ -type f -exec chmod 664 {} \;"
alias fndd="sudo find ./ -type d -exec chmod 775 {} \;"
alias fnd="fndd; fndf"
alias sitestart="mkdir makets; fnd; apre"

alias sourcer="source ~/.bash_profile"
alias bashaliases="vim ~/.bash_aliases"

alias v-upgrade="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove && vim +NeoBundleUpdate +qall"
alias v-lint="gulp lint --src"

alias open="xdg-open"
alias o="xdg-open"
alias e="sublime"

alias alert-done="paplay /usr/share/sounds/freedesktop/stereo/complete.oga"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"; alert-done'

# Timer
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Show image size
alias v-size="identify -format '%wx%h\nwidth: %wpx;\nheight: %hpx;\nwidth %wpx\nheight %hpx'"

# Show my IP
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"

# Download file and save it with filename of remote file
alias get="curl -O"

# MySQL dump
alias md='mysqldump -h localhost -u root --skip-opt --add-locks --lock-tables --extended-insert --create-options -cq'

alias adhosts='sudo vim /etc/apache2/sites-available/`whoami`.conf'
alias edhosts='sudo vim /etc/hosts'
alias apre="sudo service apache2 restart"

# SVN aliases
alias sr="svn resolved"
alias st="svn st"
alias sp="svn up"
alias stp="echo 'svn status:'; \
           st; \
           echo '- - - - - - - - - - - - - - - -'; \
           echo 'svn update:'; \
           sp"
alias stu="echo 'svn status:'; \
           st; \
           echo '- - - - - - - - - - - - - - - -'; \
           echo 'svn update:'; \
           svn merge --dry-run -r BASE:HEAD ./"
alias stm="svn log | grep -B3 merge"
alias sts="svn log | grep -B3 start"
alias sa="svn add"
alias sad="st | grep ^?"
alias sadd="st | awk '/^[?]/{ print \$2 }' | xargs svn add"
alias stc="st | grep ^C"
# Открыть конфликтные файлы в Netbeans
# alias stcn="st | awk '/^C/{ print \$2 }' | xargs '~/netbeans-7.2/bin/netbeans'"


# Git aliases
alias glog="git log --pretty=format:'%h %ad | [%an] %s%d' --graph --date=short"
alias ghist="git hist"
alias ghistp="git hist -p"
alias ghists="git hist --stat"
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gg='git gui&'
alias gtree='git log --graph --full-history --all --color --pretty=format:"%x1b[33m%h%x09%x09%x1b[32m%d%x1b[0m %x1b[34m%an%x1b[0m   %s" "$@"'
alias gpull='git pull'
alias gpush='git push'
