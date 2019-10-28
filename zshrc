export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.bin:$PATH"

ZSH_THEME="robbyrussell"

# Set Git language to English
#alias git='LANG=en_US git'
alias git='LANG=en_GB git'

# Name and save a stash by: $gitstash nice
function gitstash() {
    git stash push -m "zsh_stash_name_$1"
}

# Retrieve a stash by: $gitstashapply nice
function gitstashapply() {
    git stash apply $(git stash list | grep "zsh_stash_name_$1" | cut -d: -f1)
}

plugins=(
  git
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
  vi-mode
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

# Load zsh-syntax-highlighting; should be last.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
