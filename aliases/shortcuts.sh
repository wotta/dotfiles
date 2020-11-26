# Shortcuts

alias h='cd ~/'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'
alias hc='h && c'
alias now='date +%T'
alias back='cd $OLDPWD'

alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

alias reloadshell="source $HOME/.zshrc"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"

alias localwork="ssh-add -D; ssh-add ~/.ssh/id_rsa"
alias companywork="ssh-add -D; ssh-add ~/.ssh/motivo_rsa"

# shortcuts to configs
alias eV='vim ~/.vimrc'
alias eZ='vim ~/.zshrc'
alias phpunit="./vendor/bin/phpunit"
