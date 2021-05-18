#-------------------
# .zshrc
#-------------------

#-------------------
# zinit
#-------------------
if [[ ! -f $ZDOTDIR/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$ZDOTDIR/.zinit" && command chmod g-rwX "$ZDOTDIR/.zinit"
    command git clone https://github.com/zdharma/zinit "$ZDOTDIR/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$ZDOTDIR/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#-------------------
# Reduce delay for prompt
#-------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "${ZDOTDIR:-$HOME/.config/zsh}/.p10k.zsh" ]] || source "${ZDOTDIR:-$HOME/.config/zsh}/.p10k.zsh"

# enable instant prompt 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#-------------------
# History
#-------------------
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.config/zsh/.zhistory

#-------------------
# Options
#-------------------
setopt appendhistory autocd extendedglob
unsetopt beep

# Emacs keymaps and key bindings
bindkey -e 

# The following lines were added by compinstall
zstyle :compinstall filename "${ZDOTDIR:-$HOME/.config/zsh}/.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall

#-------------------
# Aliases 
#-------------------
#alias sudo="sudo "
#alias vim="vim -u /home/jon/.vimrc"
#alias ytdl="youtube-dl"  
#alias trashput="trash-put"
#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shellconfig/aliases" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shellconfig/aliases"

# Source configs
for f in $HOME/.config/shellconfig/*; do source "$f"; done

# Add color to ls
alias ls="ls --color=always"

# zinit aliases
alias zitsu="zinit self-update"
alias zitua="zinit update --all"

# Ruby
### Ruby Gems ### 
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

### rbenv ### 
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# End Ruby

# nvm (Node Version Manager) setup 
source /usr/share/nvm/init-nvm.sh
# end nvm

# For stack (Haskell) 
export PATH="$HOME/.local/bin:$PATH"
# End stack

# For Doom Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# JupyterLab 
### Allow third-party extensions for JupyterLab ###
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab
# End JupyterLab

# zsh syntax highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#-------------------
# zinit plugins
#-------------------
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-autosuggestions

zinit light zdharma/fast-syntax-highlighting

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
