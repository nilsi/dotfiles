# Dotfiles

## Install
* oh-my-zsh(https://github.com/ohmyzsh/ohmyzsh)
* karbiner elements (https://pqrs.org/osx/karabiner/)
* sensible side buttons (https://sensible-side-buttons.archagon.net)
* homebrew (https://brew.sh/)

## Karbiner
1. Simple modifications: caps lock -> escape
2. Complex modification -> import Vi Mode, left_control + hjkl. shift/option/command + arrow working.

## Homebrew
* Update brewfile: brew bundle dump 
* Install everything in brewfile: brew bundle

## Other
1. Install syntax highlighting by: 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting)
2. Better reverse search in terminal: $(brew --prefix)/opt/fzf/install

## Neovim

First open run PlugInstall manually.

If getting "Javascript entry not found, please compile coc.nvim by esbuild" when checkhealth. Do:
cd ${HOME}/.vim/bundles/coc.nvim/
npm install

## Autojump

Add this to ~/.zshrc file:
  [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
