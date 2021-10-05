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

# Symlink spaceship theme
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

# This is a fix to make sure the zsh folders have the correct permissions ( 755 )
compaudit | xargs chmod g-w,o-w
# chmod g-w,o-w /usr/local/share/zsh
# chmod g-w,o-w /usr/local/share/zsh/site-functions

# Run gems to install

if ! command -v colorls &> /dev/null
  then
    gem install colorls
fi

