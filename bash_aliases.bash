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
alias l='ll'

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

alias sourcer="source ~/.bash_profile"
alias bashaliases="$EDITOR ~/.bash_aliases"

alias v-upgrade=" \
        echo -e \"== Apt ==\\n\" && \
        sudo apt update && \
        sudo apt upgrade && \
        sudo apt dist-upgrade && \
        sudo apt autoremove && \
        echo -e \"== Snap ==\\n\" && \
        sudo snap refresh && \
        echo -e \"== Vim ==\\n\" && \
        vim \"+call dein#update()\" +qall \ && \
        echo -e \"== Npm ==\\n\" && \
        npm update -g && \
        npm outdated -g --depth=0 && \
        alert \
    "

alias open="xdg-open"
alias o="open"
alias oo="open ."
alias e="$EDITOR"
alias v="vim"

# Play sound Done!
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

# Show my distribution version
alias mydist="lsb_release -rc"

# Download file and save it with filename of remote file
alias get="curl -O"

# MySQL dump
alias md='mysqldump -h localhost -u root --skip-opt --add-locks --lock-tables --extended-insert --create-options -cq'

alias adhosts="sudo $EDITOR /etc/apache2/sites-available/`whoami`.conf"
alias edhosts="sudo $EDITOR /etc/hosts"
alias apre="sudo service apache2 restart"

alias v-nr="sudo service nginx restart"
alias v-ar="sudo service apache2 restart"
alias v-ns="sudo service apache2 stop && v-nr"
alias v-as="sudo service nginx stop && v-ar"

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
# Open conflicts in Netbeans
# alias stcn="st | awk '/^C/{ print \$2 }' | xargs '~/netbeans-7.2/bin/netbeans'"


# Git aliases
alias glog="git log --pretty=format:'%h %ad | [%an] %s%d' --graph --date=short"
alias ghist="git hist"
alias ghistp="ghist -p"
alias ghists="ghist --stat"
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gba="gb -a"
alias gc="git commit"
alias gcm="gc -m"
alias gcam="gc -am"
alias gd="git diff"
alias gdc="gd --cached"
alias gco="git checkout"
alias gcom="gco master"
alias gcob="git switch -c "
# alias gcob="git branch -a | ipt | xargs git checkout"
alias gk="gitk --all&"
alias gg="git gui&"
alias gtree='git log --graph --full-history --all --color --pretty=format:"%x1b[33m%h%x09%x09%x1b[32m%d%x1b[0m %x1b[34m%an%x1b[0m   %s" "$@"'
alias gpull="git pull "
alias gpullr="git pull --rebase "
alias gpullro="git pull --rebase origin "
alias gfo="git fetch origin "
alias gpush="git push"
alias gm="git merge "
alias gmnf="git merge --no-ff "


# npm aliases
alias npmr="npm run"
alias npms="npm start"
alias npmd="npmr deploy"
alias npmb="npmr build"
alias npmt="npmr test"
alias npml="npmr lint"
alias npmlt="npml && npmt"
alias npmi="npm i"
alias npmig="npmi -g"
alias npmid="npmi -D"
alias npmis="npmi -S"
alias npmu="npm-upgrade"
alias npmglist="npm list --global=true --depth=0"


# Update neovim
alias v-nvimupdate=" \
        cd ~/work/neovim && \
        gpull && \
        rm -rf build && \
        make clean && \
        make CMAKE_BUILD_TYPE=Release && \
        notify-send 'v-nvimupdate' 'install' && \
        sudo make install; \
        alert \
    "
