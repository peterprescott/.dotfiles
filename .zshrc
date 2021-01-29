### ZSH CONFIG ###
# Zsh is like Bash but better.
# Try `man zsh` for details.

### Aliases ###
# track config files in bare git .dotfiles repo
alias dotfiles='/usr/bin/git --git-dir=/home/$USERNAME/.dotfiles/ --work-tree=/home/$USERNAME'

# Zsh, Vim, Tmux, i3, XTerm ~ shortcuts to config files
alias zshconfig="edit ~/.zshrc"
alias colorconfig="edit ~/.dircolors"
alias vimconfig="edit ~/.config/nvim/init.vim"
alias tmuxconfig="edit ~/.tmux.conf"
alias i3config="edit ~/.config/i3/config"
alias xtermconfig="edit ~/.Xdefaults"

# other helpful aliases
alias ls='ls --color=auto'	# use color
alias l='ls --color=auto -a'	# show dotfiles
alias python='python3'		# python3 by default 
alias tmux='tmux -2'		# use 256 colors in tmux
alias games="cd /usr/games; ls" # play games :)

# colours are defined in ~/.dircolors
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"
export EDITOR=nvim

# Use vi keybindings 
bindkey -v

#Set up the prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{yellow}*%b%f|%r'
NEWLINE=$'\n'
export PROMPT='%B%K{blue} %2~ %k%K{white}%F{black}   %@ %f%k%b${NEWLINE} > '
export RPROMPT='%B$vcs_info_msg_0_%b'

# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors '' zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Keep 1000 lines of history
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/zsh_history

# Use conda for Python environments
# source ~/.conda
