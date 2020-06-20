#
# User configuration sourced by interactive shells
#

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Aliases ###
alias sudo="sudo "
alias vim="vim -u /home/jon/.vimrc"
alias ytdl="youtube-dl"  

### Ruby Gems ###
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

### rbenv ###
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### nvm (Node Version Manager) setup ###
source /usr/share/nvm/init-nvm.sh

## For stack (Haskell) ##
export PATH="$HOME/.local/bin:$PATH"

### JupyterLab ###
### Allow third-party extensions for JupyterLab ###
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab

# Source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source .zshenv
source $HOME/.zshenv
