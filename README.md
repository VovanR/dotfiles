dotfiles
========

My configs: bash, SVN, Git

Install
-------

    cd ~/.config
    git clone https://github.com/VovanR/dotfiles.git

Bash:

    ln -s ~/.config/dotfiles/bash_aliases ~/.bash_aliases
    ln -s ~/.config/dotfiles/bash_profile ~/.bash_profile
    source ~/.bash_profile

Git:

    ln -s ~/.config/dotfiles/gitconfig ~/.gitconfig
    ln -s ~/.config/dotfiles/gitignore_global ~/.gitignore_global
    git config --global user.name "Username"
    git config --global user.email "mail@gmail.com"

Upgrade
-------

    cd ~/.config/dotfiles
    git pull
