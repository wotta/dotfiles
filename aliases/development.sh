# Development aliases

# laravel
alias a="php artisan"
alias artisan="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"
alias dep="./vendor/bin/dep"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# alias comp ="COMPOSER_MEMORY_LIMIT=-1 composer"

# Composer
composer-link () {
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}
