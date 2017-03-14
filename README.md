# dotfiles

> My configs: bash, Git, Vim, Atom, Tmux, Node.js, Plymouth. Xubuntu.

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

Install [Dein.vim](https://github.com/Shougo/dein.vim)
```bash
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundle
rm ./installer.sh
```

Install Plugins
```bash
vim
```

Compile [vimproc](https://github.com/Shougo/vimproc.vim#building)
```bash
cd ~/.vim/bundle/repos/github.com/Shougo/vimproc.vim && make
```

Install [ack](http://beyondgrep.com/install/)
```bash
sudo apt-get install ack-grep
ln -s ~/.config/dotfiles/ackrc ~/.ackrc
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

### Node.js

[Change npm's default directory to another directory](https://docs.npmjs.com/getting-started/fixing-npm-permissions)
```bash
mkdir -p ~/.npm-global/bin
npm config set prefix '~/.npm-global'
```

See: [TypeError: Unable to watch path](https://github.com/atom/atom/blob/master/docs/build-instructions/linux.md#typeerror-unable-to-watch-path)
```
sudo sysctl fs.inotify.max_user_watches=32768
echo 32768 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
```

Defaults
```bash
npm set init-author-email mail@gmail.com
npm set init-author-name "User Name"
npm set init-author-url https://mysite.com/
npm set init-license MIT
npm set init-version 0.0.0
```

```
npm i -g diff-so-fancy
```

### [Basher](https://github.com/basherpm/basher)
```
git clone https://github.com/basherpm/basher.git ~/.basher
```

### Plymouth

Change background wallpaper
```bash
ls /usr/share/plymouth/themes/xubuntu-logo/wallpaper.png && ls /usr/share/xfce4/backdrops/Mountainous_View_by_Sven_Scheuermeier.jpg && sudo convert /usr/share/xfce4/backdrops/Mountainous_View_by_Sven_Scheuermeier.jpg /usr/share/plymouth/themes/xubuntu-logo/wallpaper.png
```

## Upgrade

```bash
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
