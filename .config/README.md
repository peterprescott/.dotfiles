### PERSONAL CONFIG CHEATSHEET

1. FREEDOM

"*Free* as in *free speech*, not as in *free beer*."
[GNU](https://www.gnu.org/philosophy/free-sw.html)

"It is for freedom that Christ has set us free. Stand firm, then, and do not
submit again to a yoke of slavery."
[Galatians 5:1](https://biblehub.com/galatians/5-1.htm)

"Remember that you were slaves in Egypt and that the LORD your God brought you
out of there with a mighty hand and an outstretched arm." 
[Deuteronomy 5:15](https://biblehub.com/deuteronomy/5-15.htm)

2. OPERATING SYSTEM

[Install Linux Debian.](https://www.debian.org/distrib/)

3. GIT

Track everything with [Git](https://git-scm.com/).

```
sudo apt-get install git
```

4. DOTFILES

Clone dotfiles into bare git repo.

```
# clone dotfiles bare repo 
git clone --bare https://github.com/$USERNAME/.dotfiles.git $HOME/.dotfiles

# define alias 
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ignore untracked files 
dotfiles config --local status.showUntrackedFiles no

# checkout dotfiles 
dotfiles checkout

# add/commit/push dotfiles 
dotfiles add FILE 
dotfiles commit -m "Add FILE that does THING" 
dotfiles push  

```

5. ZSH

Better than the BASH shell, but compatible ([unlike FISH](https://zellwk.com/blog/bash-zsh-fish/)).

```
# download zsh
sudo apt-get install zsh

# set default shell to zsh
chsh -s /bin/zsh

# load zsh config
source ~/.zshrc

# edit zsh config as necessary
zshconfig

# edit colo(u)rs as necessary
colorconfig
```

6. VIM

It's not just a text editor, it's a *movement* (without arrow keys).

```
# download (neo)vim
sudo apt-get install neovim

# set neovim as default editor for debian
sudo update-alternatives --config editor # and select number

# check the configuration
vimconfig

# download vim-plug to manage plugins
sh -c 'curl -fLo \
     "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
     --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'                                                 

# or if you've got my dotfiles, just run ~/.config/nvim/get-vim-plug.sh
```

Then open vim and run `:PlugInstall` to install the plugins. I you don't know vim, then it's `:q` to quit (or `:q!` to quit without saving)
`h`,`j`,`k`, and `l` to move around; `i` to go into *insert* mode and `ESC` to
escape to normal mode. And that's enough to start with. Then ask for `:help`.

My ZSH shell is also configured to use vim key-bindings to move around.

For a fun way of practising using `h`,`j`,`k`, and `l` to move around, download
and play `rogue`.

```
sudo apt-get install bsdgames-nonfree # installs rogue
rogue
```

7. TMUX

Because you don't need a Graphical User Interface to have multiple windows.

```
# download tmux
sudo apt-get install tmux

# run tmux
tmux

# check the configuration
tmuxconfig
```

I use CTRL+SPACE as the magic bind-key, instead of the default CTRL+b.
After you have pressed (and let go) of that combination, press `v` for a
vertical line splitting your screen into two windows, or `s` for a sideways
line. <BINDKEY> + SPACE swaps it from horizontal to vertical. CTRL+h/j/k/l then
resizes the tiled windows.

8. w3m

Because you don't need a GUI to browse the internet.

```
# download w3m
sudo apt-get install w3m

# pick a starting page and browse from there (with vim keys!)
w3m hackernews.org
w3m google.com
```

9. i3

But maybe you need a GUI for *something*...

```
# download the x graphical server
sudo apt-get install xserver-xorg
sudo apt-get install xinit

# download the x terminal emulator
sudo apt-get install xterm
# select xterm as default terminal emulator
sudo update-alternatives --config x-terminal-emulator 
# check xterm configuration
xtermconfig

# download i3 as window manager
sudo apt-get install i3
# check i3 configuration
i3config

# tell x to run i3 on launch
# (my dotfiles already have this in place)
echo 'exec i3' > ~/.xinitrc

# run GUI
startx
```

