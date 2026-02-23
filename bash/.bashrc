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
# zoxide instead of cd
#alias cd='z'
alias edit-in-kitty='kitten edit-in-kitty'
alias piggysleep='~/Documents/TogetherDoughFiles/piggysleep.sh'
#alias testgp='jstest /dev/input/js0'
PS1='[\u@\h \W]\$ '
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
# fzf keybindings + completion
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash
