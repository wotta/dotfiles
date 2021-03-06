#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type.
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;" || true

# Install PHP extensions with PECL
pecl install memcached imagick xdebug

# Install global Composer packages
/usr/local/bin/composer global require \
    laravel/installer \
    laravel/valet \
    beyondcode/expose \
    tightenco/takeout

# Install global npm packages
/usr/local/bin/npm install --global \
	kmdr # https://kmdr.sh

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install
# Check if the tld isn't wotty. if so run script
if $HOME/.composer/vendor/bin/valet tld | grep -q 'test'; then
	$HOME/.composer/vendor/bin/valet tld wotty
fi

# Create a projects directory
mkdir $HOME/projects

# Clone Github repositories
./projects/clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Added global ignore file as symlink and set the global git config.
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Add ini symlink so we can easily acces it.
# This can be done as: php -c ./disable-xdebug.ini vendor/bin/phpunit
ln -s $HOME/.dotfiles/php/ini/disable-xdebug.ini $HOME/disable-xdebug.ini

# Symlink spaceship theme
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

# This is a fix to make sure the zsh folders have the correct permissions ( 755 )
compaudit | xargs chmod g-w,o-w
# chmod g-w,o-w /usr/local/share/zsh
# chmod g-w,o-w /usr/local/share/zsh/site-functions

# Symlink the Mackup config file to the home directory
# ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
