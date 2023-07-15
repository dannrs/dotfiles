set fish_greeting

# PATH #
set -e fish_user_paths
set -U fish_user_paths PATH $HOME/.local/bin $fish_user_paths
set -U fish_user_paths PATH $HOME/.nix-profile/bin $fish_user_paths
set -U fish_user_paths PATH $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths PATH $HOME/.local/bin/lua-language-server/bin $fish_user_paths
set -x XDG_CURRENT_DESKTOP i3

set -gx EDITOR nvim

# ALIAS #
alias reboot='loginctl reboot'
alias poweroff='loginctl poweroff'
alias suspend='loginctl suspend'

alias xi='sudo xbps-install -S'
alias xq='sudo xbps-query -l | grep'
alias xrs='sudo xbps-query -Rs'
alias xr='sudo xbps-remove -Rcon'
alias xu='sudo xbps-install -Suv'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias vim='nvim'
alias npm='pnpm'

starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/danni/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
