#!/bin/sh

echo "Cloning repositories..."

PROJECTS=$HOME/projects
PERSONAL=$PROJECTS/perosnal
WORK=$PROJECTS/work

# Personal
git clone git@github.com:wotta/wotta.git $PERSONAL/wotta
git clone git@github.com:wotta/illuminate-extender.git $PERSONAL/illuminate-extender
git clone git@github.com:wotta/consolehints.git $PERSONAL/consolehints

# Work
