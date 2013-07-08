###########
# Aliases #
###########
# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Easier navigation: .., ..., ~
alias ..="cd ..;" # .. .. ..
alias ...="cd ../.."
alias ~="cd ~"

# User scripts are located in ~/.local/bin
alias sc='simple-commit.sh'
alias crp='cropp.sh'
alias psd2png='psd2png.sh'
alias addhosts='sudo $HOME/.local/bin/addhosts.sh'

# MySQL dump
alias md='mysqldump -h localhost -u root --skip-opt --add-locks --lock-tables --extended-insert --create-options -cq'

alias adhosts='sudo nano /etc/apache2/sites-available/`whoami`'
alias edhosts='sudo nano /etc/hosts'

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
#alias stcn="st | awk '/^C/{ print \$2 }' | xargs '~/netbeans-7.2/bin/netbeans'"

alias fndf="sudo find ./ -type f -exec chmod 777 {} \;"
alias fndd="sudo find ./ -type d -exec chmod 777 {} \;"
alias fnd="sudo chmod 777 -R ./"
alias apre="sudo service apache2 restart"
alias sitestart="mkdir makets; fnd; apre"

alias sourcer="source ~/.bash_profile"
alias bashaliases="nano ~/.bash_aliases"
alias open="xdg-open"


# Git aliases
alias glog="git log --pretty=format:'%h %ad | [%an] %s%d' --graph --date=short"
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

alias gg='git gui&'
