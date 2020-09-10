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
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/#how-to-install)

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

```shell
sudo apt install fonts-ibm-plex fonts-hack
```

### Bash

```shell
mkdir -p ~/.bash-completion
ln -sf ~/.config/dotfiles/bash_aliases.bash ~/.bash_aliases
ln -sf ~/.config/dotfiles/bash_functions.bash ~/.bash_functions
ln -sf ~/.config/dotfiles/bash_profile.bash ~/.bash_profile
ln -sf ~/.config/dotfiles/bash_prompt.bash ~/.bash_prompt
ln -sf ~/.config/dotfiles/inputrc ~/.inputrc
ln -sf ~/.config/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.config/dotfiles/Xresources ~/.Xresources
ln -sf ~/.config/dotfiles/albertignore ~/.albertignore
xrdb -merge ~/.Xresources
source ~/.bash_profile
```

### Color scheme

- See: [Preview themes](http://chriskempson.com/projects/base16/)

Install [Base16 Shell](https://github.com/chriskempson/base16-shell#installation)
```shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

Apply theme
```shell
base16_atelier-forest
base16_bespin
```

or
```shell
base16_bespin
```

### Git

```shell
git config -f ~/.gitlocal user.name "Username"
git config -f ~/.gitlocal user.email "mail@gmail.com"
ln -sf ~/.config/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.config/dotfiles/gitignore_global ~/.gitignore_global
```

### Atom

```shell
ln -sf ~/.config/dotfiles/atom/snippets.cson ~/.atom/snippets.cson
```

### Vim

```shell
mkdir -p ~/.vim/{backups,bundle,swaps,undo}
ln -sf ~/.config/dotfiles/vimrc ~/.vim/vimrc
ln -sfn ~/.config/dotfiles/snippets ~/.vim/UltiSnips
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
ln -sf ~/.config/dotfiles/ackrc ~/.ackrc
```

#### [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

```shell
ln -sf ~/.vim ~/.config/nvim
ln -sf ~/.config/nvim/vimrc ~/.config/nvim/init.vim
```
Check [PYTHON QUICKSTART](https://neovim.io/doc/user/provider.html#provider-python) section to using Vim Python 2/3 plugins with Nvim
```
:checkhealth
```

### Tmux

Install [Tmuxinator](https://github.com/tmuxinator/tmuxinator)
```shell
sudo gem install tmuxinator
```

Add [completion](https://github.com/tmuxinator/tmuxinator#completion)
```shell
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash -P ~/.bash-completion/
```

### [Alacritty](https://github.com/jwilm/alacritty)

```shell
ln -sf ~/.config/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp ~/work/alacritty/extra/completions/alacritty.bash ~/.bash-completion/
```

### Node.js

[Change npm's default directory to another directory](https://docs.npmjs.com/getting-started/fixing-npm-permissions)
```shell
mkdir -p ~/.npm-global/bin
npm config set prefix '~/.npm-global'
```

See: [TypeError: Unable to watch path](https://flight-manual.atom.io/hacking-atom/sections/hacking-on-atom-core/#typeerror-unable-to-watch-path)
```shell
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
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

```shell
basher install vovanr/v-dummyimage
basher install vovanr/v-pomodoro-alert
basher install vovanr/git-delete-current-branch
basher install vovanr/clone-my-repo
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
rustup update stable
```

## Further customization

- Add any Bash profile customizations to `~/.bashlocal`
- Add your git username/email/etc. to `~/.gitlocal`
- Just fork this repo and hack on.

## Resources

- [GitHub ❤ ~/](http://dotfiles.github.io/)
