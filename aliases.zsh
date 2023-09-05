# Load in all aliases so they are used.

source $DOTFILES/aliases/system.sh
source $DOTFILES/aliases/shortcuts.sh
source $DOTFILES/aliases/git.sh

composer-link() {
    ./vendor/bin/sail composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias art='[ -f artisan ] && php artisan || php artisan'
