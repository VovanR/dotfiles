# dotfiles

My configs: bash, Git, Vim, Tmux, Node.
My system is Xubuntu.

## Install

```sh
cd ~/.config
git clone https://github.com/VovanR/dotfiles.git
```

### Font
Download [Hack](https://github.com/chrissimpkins/Hack)
Copy it to `~/.fonts/truetype/Hack/`
```sh
$ tree ~/.fonts/truetype/
~/.fonts/truetype/
└── Hack
    ├── Hack-BoldItalic.ttf
    ├── Hack-Bold.ttf
    ├── Hack-Italic.ttf
    └── Hack-Regular.ttf
```

### Bash

```sh
ln -s ~/.config/dotfiles/bash_functions ~/.bash_functions
ln -s ~/.config/dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/.config/dotfiles/bash_prompt ~/.bash_prompt
ln -s ~/.config/dotfiles/bash_profile ~/.bash_profile
ln -s ~/.config/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.config/dotfiles/inputrc ~/.inputrc
ln -s ~/.config/dotfiles/Xresources ~/.Xresources
xrdb -merge ~/.Xresources
source ~/.bash_profile
```

### Git

```sh
git config -f ~/.gitlocal user.name "Username"
git config -f ~/.gitlocal user.email "mail@gmail.com"
ln -s ~/.config/dotfiles/gitconfig ~/.gitconfig
ln -s ~/.config/dotfiles/gitignore_global ~/.gitignore_global
```

### Vim

Install [NeoBundle](https://github.com/Shougo/neobundle.vim):
```sh
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

```sh
ln -s ~/.config/dotfiles/vimrc ~/.vimrc
ln -s ~/.config/dotfiles/snippets ~/.vim/
```

Install Plugins:
```sh
vim +NeoBundleInstall +qall
```

Install [ack](http://beyondgrep.com/install/)

in Ubuntu:
```sh
sudo apt-get install ack-grep
ln -s ~/.config/dotfiles/ackrc ~/.ackrc
```

### Tmux

Install [Tmuxinator](https://github.com/tmuxinator/tmuxinator):
```sh
sudo gem install tmuxinator
```

## Node
Install [nvm](https://github.com/creationix/nvm)
```sh
npm set init-author-email mail@gmail.com
npm set init-author-name "User Name"
npm set init-author-url http://mysite.com/
npm set init-license MIT
npm set init-version 0.0.0
```

## Upgrade

```sh
cd ~/.config/dotfiles
git pull
vim +NeoBundleUpdate +qall
```

## Further customization
- Add any Bash profile customizations to `~/.bashlocal`
- Add your git username/email/etc. to `~/.gitlocal`
- Just fork this repo and hack on.
