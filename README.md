# dotfiles

> My configs: bash, Git, Vim, Atom, Tmux, Node, Plymouth. Xubuntu.

## Install

```bash
cd ~/.config
git clone https://github.com/VovanR/dotfiles.git
```

### Font
Download [Hack](https://github.com/chrissimpkins/Hack)
Copy it to `~/.fonts/truetype/Hack/`
```bash
$ tree ~/.fonts/truetype/
~/.fonts/truetype/
└── Hack
    ├── Hack-BoldItalic.ttf
    ├── Hack-Bold.ttf
    ├── Hack-Italic.ttf
    └── Hack-Regular.ttf
```

### Color scheme
Install [Base16 Shell](https://github.com/chriskempson/base16-shell#installation)
```bash
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

### Bash

```bash
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

```bash
git config -f ~/.gitlocal user.name "Username"
git config -f ~/.gitlocal user.email "mail@gmail.com"
ln -s ~/.config/dotfiles/gitconfig ~/.gitconfig
ln -s ~/.config/dotfiles/gitignore_global ~/.gitignore_global
```

### Atom

```bash
ln -s ~/.config/dotfiles/atom/snippets.cson ~/.atom/snippets.cson
```

### Vim

Dirs
```bash
mkdir -p ~/.vim/{backups,bundle,swaps,undo}
```

```bash
ln -s ~/.config/dotfiles/vimrc ~/.vim/vimrc
ln -s ~/.config/dotfiles/snippets ~/.vim/UltiSnips
```

Install [NeoBundle](https://github.com/Shougo/neobundle.vim):
```bash
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

Install Plugins:
```bash
vim +NeoBundleInstall +qall
```

Compile YouCompleteMe
```bash
sudo apt-get install build-essential cmake python-dev libboost-all-dev
mkdir ~/ycm_build
cd ~/ycm_build
cmake -DUSE_SYSTEM_BOOST=ON -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make
```

Neovim
```bash
ln -s ~/.vim ~/.config/nvim
ln -s ~/.config/nvim/vimrc ~/.config/nvim/init.vim
```

Install [ack](http://beyondgrep.com/install/)

in Ubuntu:
```bash
sudo apt-get install ack-grep
ln -s ~/.config/dotfiles/ackrc ~/.ackrc
```

### Tmux

Install [Tmuxinator](https://github.com/tmuxinator/tmuxinator):
```bash
sudo gem install tmuxinator
```

## Node
[Change npm's default directory to another directory](https://docs.npmjs.com/getting-started/fixing-npm-permissions):
```bash
mkdir -p ~/.npm-global/bin
npm config set prefix '~/.npm-global'
```
Defaults:
```bash
npm set init-author-email mail@gmail.com
npm set init-author-name "User Name"
npm set init-author-url http://mysite.com/
npm set init-license MIT
npm set init-version 0.0.0
```

## Plymouth
```bash
ls /lib/plymouth/themes/xubuntu-logo/wallpaper.png && ls /usr/share/xfce4/backdrops/cloudbreaker.jpg && sudo convert /usr/share/xfce4/backdrops/cloudbreaker.jpg /lib/plymouth/themes/xubuntu-logo/wallpaper.png
```

## Upgrade

```bash
cd ~/.config/dotfiles
git pull
vim +NeoBundleUpdate +qall
```

## Further customization
- Add any Bash profile customizations to `~/.bashlocal`
- Add your git username/email/etc. to `~/.gitlocal`
- Just fork this repo and hack on.
