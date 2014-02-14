dotfiles
========

My configs: bash, SVN, Git, Vim

Install
-------

    cd ~/.config
    git clone https://github.com/VovanR/dotfiles.git
    git submodule update --init --recursive

Bash:

    ln -s ~/.config/dotfiles/bash_aliases ~/.bash_aliases
    ln -s ~/.config/dotfiles/bash_profile ~/.bash_profile
    source ~/.bash_profile

Git:

    ln -s ~/.config/dotfiles/gitconfig ~/.gitconfig
    ln -s ~/.config/dotfiles/gitignore_global ~/.gitignore_global
    git config --global user.name "Username"
    git config --global user.email "mail@gmail.com"

Vim:

Install [pathogen.vim](https://github.com/tpope/vim-pathogen)

    ln -s ~/.config/dotfiles/vimrc ~/.vimrc
    ln -s ~/.config/dotfiles/vim/bundle ~/.vim/bundle

Upgrade
-------

    cd ~/.config/dotfiles
    git pull
