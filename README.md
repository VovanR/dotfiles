# dotfiles

> My configs: Bash, Git, Atom, Vim, Tmux, Alacritty, Node, Plymouth. Xubuntu.

## Table of Contents

- [Install](#install)
  - [Font](#font)
  - [Color scheme](#color-scheme)
  - [Bash](#bash)
  - [Git](#git)
  - [Atom](#atom)
  - [Vim](#vim)
     - [Neovim](#neovim)
  - [Tmux](#tmux)
  - [Alacritty](#alacritty)
  - [Node.js](#nodejs)
  - [Basher](#basher)
  - [Plymouth](#plymouth)
- [Fix Xubuntu keyboard auto repeat delay and repeat rate](#fix-xubuntu-keyboard-auto-repeat-delay-and-repeat-rate)
- [Upgrade](#upgrade)
- [Further customization](#further-customization)
- [Resources](#resources)

## Install

```shell
git clone https://github.com/VovanR/dotfiles.git ~/.config/dotfiles
```

### Font

Download any TrueType font
- [Hack](https://github.com/chrissimpkins/Hack)
- [Input](http://input.fontbureau.com/)
- [IBM Plex Mono](https://github.com/IBM/plex/releases)

Copy it to `~/.fonts/truetype/`
```shell
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
```shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

Apply theme
```shell
base16_atelier-forest
```

### Bash

```shell
ln -s ~/.config/dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/.config/dotfiles/bash_functions ~/.bash_functions
ln -s ~/.config/dotfiles/bash_profile ~/.bash_profile
ln -s ~/.config/dotfiles/bash_prompt ~/.bash_prompt
ln -s ~/.config/dotfiles/inputrc ~/.inputrc
ln -s ~/.config/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.config/dotfiles/Xresources ~/.Xresources
xrdb -merge ~/.Xresources
source ~/.bash_profile
```

### Git

```shell
git config -f ~/.gitlocal user.name "Username"
git config -f ~/.gitlocal user.email "mail@gmail.com"
ln -s ~/.config/dotfiles/gitconfig ~/.gitconfig
ln -s ~/.config/dotfiles/gitignore_global ~/.gitignore_global
```

### Atom

```shell
ln -s ~/.config/dotfiles/atom/snippets.cson ~/.atom/snippets.cson
```

### Vim

```shell
mkdir -p ~/.vim/{backups,bundle,swaps,undo}
ln -s ~/.config/dotfiles/vimrc ~/.vim/vimrc
ln -s ~/.config/dotfiles/snippets ~/.vim/UltiSnips
```

Install [Dein.vim](https://github.com/Shougo/dein.vim)
```shell
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundle
rm ./installer.sh
```

Install Plugins
```shell
vim
```

Compile [vimproc](https://github.com/Shougo/vimproc.vim#building)
```shell
cd ~/.vim/bundle/repos/github.com/Shougo/vimproc.vim && make
```

Install [ack](http://beyondgrep.com/install/)
```shell
curl https://beyondgrep.com/ack-2.18-single-file > ~/.local/bin/ack && chmod 0755 ~/.local/bin/ack
ln -s ~/.config/dotfiles/ackrc ~/.ackrc
```

#### [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

```shell
ln -s ~/.vim ~/.config/nvim
ln -s ~/.config/nvim/vimrc ~/.config/nvim/init.vim
```
Check [PYTHON QUICKSTART](https://neovim.io/doc/user/provider.html#provider-python) section to using Vim Python 2/3 plugins with Nvim

### Tmux

Install [Tmuxinator](https://github.com/tmuxinator/tmuxinator)
```shell
sudo gem install tmuxinator
```

Add [completion](https://github.com/tmuxinator/tmuxinator#completion)
```shell
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash -P ~/.local/bin/
```

### [Alacritty](https://github.com/jwilm/alacritty)

```shell
ln -s ~/.config/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
```

### Node.js

[Change npm's default directory to another directory](https://docs.npmjs.com/getting-started/fixing-npm-permissions)
```shell
mkdir -p ~/.npm-global/bin
npm config set prefix '~/.npm-global'
```

See: [TypeError: Unable to watch path](https://flight-manual.atom.io/hacking-atom/sections/hacking-on-atom-core/#typeerror-unable-to-watch-path)
```shell
echo fs.inotify.max_user_watches=32768 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

Defaults
```shell
npm set init-author-email mail@gmail.com
npm set init-author-name "User Name"
npm set init-author-url https://mysite.com/
npm set init-license MIT
npm set init-version 0.0.0
```

```shell
npm i -g diff-so-fancy
```

### [Basher](https://github.com/basherpm/basher)

```shell
git clone https://github.com/basherpm/basher.git ~/.basher
```

### Plymouth

Change background wallpaper
```shell
ls /usr/share/plymouth/themes/xubuntu-logo/wallpaper.png && ls /usr/share/xfce4/backdrops/Mountainous_View_by_Sven_Scheuermeier.jpg && sudo convert /usr/share/xfce4/backdrops/Mountainous_View_by_Sven_Scheuermeier.jpg /usr/share/plymouth/themes/xubuntu-logo/wallpaper.png
```

## Fix Xubuntu keyboard auto repeat delay and repeat rate

```shell
crontab -e
```
Add
```cron
*/15 * * * * DISPLAY=:0 /usr/bin/xset r rate 300 30
```

## Upgrade

```shell
cd ~/.config/dotfiles
git pull
vim
cd ~/.config/base16-shell
git pull
basher update
```

## Further customization

- Add any Bash profile customizations to `~/.bashlocal`
- Add your git username/email/etc. to `~/.gitlocal`
- Just fork this repo and hack on.

## Resources

- [GitHub ❤ ~/](http://dotfiles.github.io/)
