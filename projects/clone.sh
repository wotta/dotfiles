#!/bin/sh

echo "Cloning repositories..."

PROJECTS=$HOME/projects
PERSONAL=$PROJECTS/personal
WORK=$PROJECTS/work

# ZSH 
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Personal
git clone git@github.com:wotta/wotta.git $PERSONAL/wotta
git clone git@github.com:wotta/illuminate-extender.git $PERSONAL/illuminate-extender
git clone git@github.com:wotta/consolehints.git $PERSONAL/consolehints

# Work
