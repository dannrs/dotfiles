#Prompt
PS1="%F{green}%B%~/%b%f "

#Exports 
export PATH="$HOME/.local/bin/:$PATH"

#Spotifetch
export SPOTIPY_CLIENT_ID='591018639cc34acfb3899ff38a98376a'
export SPOTIPY_CLIENT_SECRET='fac978f6221c49b1a24b098f01344838'
export SPOTIPY_REDIRECT_URI='http://127.0.0.1:9090'

# Aliases
alias ls='ls --color=auto -t'
alias cls='clear'
alias py='python3'
alias pip='pip3'
alias ytdl='youtube-dl'
alias docker='sudo docker'
alias open='xdg-open'
alias sudo='sudo -p "$(printf "\033[1;31mPassword: \033[0;0m" )"'
alias rm='printf "\033[1;31m" && rm -rIv'
alias cp='printf "\033[1;32m" && cp -rv'
alias mv='printf "\033[1;34m" && mv -v'
alias mkdir='printf "\033[1;33m" && mkdir -v'
alias rmdir='printf "\033[1;35m" && rmdir -v'
alias vim='nvim'
alias lyrics='sptlrx'
alias ping='ping 8.8.8.8'
alias wall='feh --bg-fill'
alias dotfiles='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# History
HISTSIZE=500
SAVEHIST=1000
HISTFILE=.cache/zsh_history

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#binds
bindkey "^[[3~" delete-char
bindkey "^A" beginning-of-line
bindkey "^Q" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export PATH="$PATH:$HOME/.spicetify"
