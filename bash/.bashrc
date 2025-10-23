#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
alias ls='eza --icons=always'
alias ff='fastfetch'
alias vim='nvim'
alias grep='grep --color=auto'
alias cd='z'
PS1='[\u@\h \W]\$ '
# zoxide instead of cd
eval "$(starship init bash)"
# Smarter'er history
# Append to history file immediately after each command
shopt -s histappend
PROMPT_COMMAND="history -a; history -n;$PROMPT_COMMAND"
# Increase the size of the history file
HISTSIZE=10000
HISTFILESIZE=20000
fastfetch
eval "$(zoxide init bash)"
