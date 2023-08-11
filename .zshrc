### ZSH CONFIG ###

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
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors '' zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Use vi keybindings 
bindkey -v

# default to tmux shell
if [[ -z "$TMUX" ]]; then
        tmux
fi

### Aliases ###
alias dotfiles='/usr/bin/git --git-dir=/home/$USERNAME/.dotfiles/ --work-tree=/home/$USERNAME'

# Zsh, Vim, Tmux, i3, XTerm ~ shortcuts to config files
alias zshconfig="vi ~/.zshrc"
alias vimconfig="vi ~/.config/nvim/init.vim"
alias tmuxconfig="vi ~/.tmux.conf"
alias i3config="vi ~/.config/i3/config"
alias xtermconfig="vi ~/.Xdefaults"

# other helpful aliases
alias ls='ls --color=auto'	# use color
alias tmux='tmux -2'		# use 256 colors in tmux

# 
# source ~/.init_conda
