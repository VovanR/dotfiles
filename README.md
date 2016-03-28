# dotfiles

> My configs: bash, Git, Vim, Atom, Tmux, Node, Plymouth. Xubuntu.

## Install

```bash
git clone https://github.com/VovanR/dotfiles.git ~/.config/dotfiles
```

### Font

Download [Hack](https://github.com/chrissimpkins/Hack) or [Input](http://input.fontbureau.com/)

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

```bash
mkdir -p ~/.vim/{backups,bundle,swaps,undo}
ln -s ~/.config/dotfiles/vimrc ~/.vim/vimrc
ln -s ~/.config/dotfiles/snippets ~/.vim/UltiSnips
```

Install [NeoBundle](https://github.com/Shougo/neobundle.vim)
```bash
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm ./install.sh
```

Install Plugins
```bash
vim +NeoBundleInstall +qall
```

Compile [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#installation)
```bash
sudo apt-get install build-essential cmake python-dev libboost-all-dev
cd ~/.vim/bundle/YouCompleteMe && ./install.py
```

Install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher#installing)
```bash
sudo apt-get install silversearcher-ag
```

#### [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```bash
ln -s ~/.vim ~/.config/nvim
ln -s ~/.config/nvim/vimrc ~/.config/nvim/init.vim
```
Check [Quickstart](https://neovim.io/doc/user/nvim_python.html) section to using Vim Python 2/3 plugins with Nvim

### Tmux

Install [Tmuxinator](https://github.com/tmuxinator/tmuxinator)
```bash
sudo gem install tmuxinator
```

Add [completion](https://github.com/tmuxinator/tmuxinator#completion)
```bash
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash -P ~/.local/bin/
```

### Node

[Change npm's default directory to another directory](https://docs.npmjs.com/getting-started/fixing-npm-permissions)
```bash
mkdir -p ~/.npm-global/bin
npm config set prefix '~/.npm-global'
```

Defaults
```bash
npm set init-author-email mail@gmail.com
npm set init-author-name "User Name"
npm set init-author-url https://mysite.com/
npm set init-license MIT
npm set init-version 0.0.0
```

### Plymouth

Change background wallpaper
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

## Resources

- [GitHub ❤ ~/](http://dotfiles.github.io/)
