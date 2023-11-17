export ZSH="$HOME/.oh-my-zsh"

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/repos/flutter/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/cmdline-tools/latest/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/extras/google/instantapps:$PATH"

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.0.1.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"


export GEM_HOME="$HOME/.gem"

eval "$(pyenv init -)"
eval "$(rbenv init - zsh)"

alias studio="open -a /Applications/Android\ Studio.app"

alias :q="exit"
alias :wq="exit"


ZSH_THEME="robbyrussell"

# Set Git language to English
alias git='LANG=en_GB git'

alias vim='nvim'

# Set common ip addresses used for adb connect
alias -g load="10.180.85.212:5665"
alias -g dig="10.180.85.83:5665"
alias -g simulator="10.180.85.254:5665"

# For connecting to my common android devices

# Name and save a stash by: $gitstash stash_name
function gitstash() {
    git stash push -m "zsh_stash_name_$1"
}

# Retrieve a stash by: $gitstashapply stash_name
function gitstashapply() {
    git stash apply $(git stash list | grep "zsh_stash_name_$1" | cut -d: -f1)
}

plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  vi-mode
  zsh-syntax-highlighting
)

#make jj go to command mode
bindkey -M viins 'jj' vi-cmd-mode

#make v open current command in vim
bindkey -M vicmd v edit-command-line

#allow backspace to delete before insert point
#http://permalink.gmane.org/gmane.comp.shells.zsh.user/9770
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.utf-8
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'


# Update outdated packages for sketchybar after running brew commands
function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

# autojump
 [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
