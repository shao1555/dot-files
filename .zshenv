# Japanese setting
export LANG=ja_JP.UTF-8
export SHELL=/bin/zsh

export TZ=JST-9
export EDITOR="vim"
export SVN_EDITOR="vim"
export PAGER=`which less`
export SHELL=`which zsh`
export LESS="-i -M -R"
export GREP_COLOR="01;33"
export GREP_OPTIONS="--color=auto"
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

umask 022

# Path Setting
path=(/opt/local/bin /opt/local/sbin $HOME/local/bin $HOME/local/X11R6/bin /bin /usr/local/bin /usr/bin /usr/X11R6/bin /sbin /usr/sbin)
manpath=(/usr/share/man )

# SSH Agent
[[ -f "/bin/launchctl" ]] && export SSH_AUTH_SOCK=$(launchctl getenv SSH_AUTH_SOCK)

# RVM (Ruby Version Manager)
[[ -x "$HOME/.rvm/scripts/rvm" ]] && "$HOME/.rvm/scripts/rvm"

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

# Android
export ANDROID_SDK_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_HOME/tools
export PATH=$PATH:$ANDROID_SDK_HOME/platform-tools

# homebrew
export PATH=/usr/local/sbin:$PATH # homebrew

# use MacVim instead of bundled vim
[[ -d "/Applications/MacVim.app" ]] && alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

### end of file
