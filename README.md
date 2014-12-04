# dotfiles

My configs: bash, SVN, Git, Vim

## Install

```
cd ~/.config
git clone https://github.com/VovanR/dotfiles.git
```

### Bash

```
ln -s ~/.config/dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/.config/dotfiles/bash_profile ~/.bash_profile
ln -s ~/.config/dotfiles/inputrc ~/.inputrc
ln -s ~/.config/dotfiles/Xresources ~/.Xresources
xrdb -merge ~/.Xresources
source ~/.bash_profile
```

### Git

```
ln -s ~/.config/dotfiles/gitconfig ~/.gitconfig
ln -s ~/.config/dotfiles/gitignore_global ~/.gitignore_global
git config --global user.name "Username"
git config --global user.email "mail@gmail.com"
```

### Vim

Install [Vundle](https://github.com/gmarik/Vundle.vim):
```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

```
ln -s ~/.config/dotfiles/vimrc ~/.vimrc
```

Install Plugins:
```
vim +PluginInstall +qall
```

```
cd ~/.vim/bundle/tern_for_vim
npm install
```

Install [ack](http://beyondgrep.com/install/)

in Ubuntu:
```
sudo apt-get install ack-grep
ln -s ~/.config/dotfiles/ackrc ~/.ackrc
```

## Upgrade

```
cd ~/.config/dotfiles
git pull
vim +PluginUpdate +qall
```
