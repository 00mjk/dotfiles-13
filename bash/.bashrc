#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

### Ruby Gems Bundler ###
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

### rbenv ###
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Android ###
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
###

export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

### Bash Defaults ### 

### Bash Aliases ###
alias sudo="sudo "
alias vim="vim -u /home/jon/.vimrc"
alias ytdl="youtube-dl"

### nvm (Node Version Manager) setup ###
source /usr/share/nvm/init-nvm.sh
