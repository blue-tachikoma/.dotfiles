# oh-my-zsh 
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose dnf npm sbt scala sdk sudo)
source $ZSH/oh-my-zsh.sh
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# bindings
bindkey '^B' backward-word              # ctrl + b    | go to word before
bindkey '^W' forward-word               # ctrl + w    | go to word after
bindkey '^[^M' autosuggest-execute      # alt + enter | use suggestion from zsh-autosuggestions
bindkey '^U' backward-kill-line         # ctrl + u    | clear the line before cursor
bindkey '^X' kill-word                  # ctrl + x    | delete word after
bindkey -s '^Q' 'source $HOME/.zshrc\n' # ctrl + q    | reload zsh config

# >>> coursier install directory >>>
export PATH="$PATH:$HOME/.local/share/coursier/bin"
# <<< coursier install directory <<<

# SDKMAN, must be at the end of the file
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
