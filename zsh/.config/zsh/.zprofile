# zsh does not run .profile by default
# call .profile here to keep it shell independent
emulate sh
. $HOME/.profile
emulate zsh
