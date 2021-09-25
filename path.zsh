# Ruby tools
#export GEM_HOME="$HOME/.gem/ruby/2.3.0"
export GEM_HOME="$HOME/.gem/ruby/2.6.0"
#export GEM_HOME="$HOME/.gem/ruby/2.7.0"
export PATH="$GEM_HOME/bin:$PATH"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

export PATH="/usr/local/sbin:$PATH"
