# System aliases
alias update="source ~/.zshrc; c"

# permissions
alias permission="stat -f '%A %a %N'"

# zsh config
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# ls aliases
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long' # detailed list view
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"