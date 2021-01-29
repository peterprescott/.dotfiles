# Dotfiles

A **dotfile** is a Linux configuration file, usually prefaced with a dot (like
`.config`) so that it stays hidden (ie. when you list files with `ls`) unless
you explicitly look for it (`ls -a`).

Such things are very much a question of personal preference and incremental
evolution, so it is good to keep track of your own with a git repository.
Arguably, the best setup uses a *bare repository*, as suggested by
[`@StreakyCobra`](https://news.ycombinator.com/item?id=11070797).

```{sh}

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

My configuration combines various pieces:
- vim for the editor, and vim key-bindings wherever possible;
- zsh for the shell;
- tmux for managing panels and windows without a GUI environment;
- i3 for managing panels and windows within a GUI environment;
- xterm as terminal emulator within a GUI environment;
- a .dircolors file which works both with and without GUI;
- welcome messages that help the user get started;
- aliases to go straight to whichever config file you want to edit.





