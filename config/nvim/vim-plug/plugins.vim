" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    
    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'unkiwii/vim-nerdtree-sync'
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Preview vim latex tex files live
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    " Theme
    Plug 'joshdick/onedark.vim'
    
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Keeping up to date with master
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    " Better use of . command 
    Plug 'tpope/vim-repeat'
    
    " Surround anything    
    Plug 'tpope/vim-surround'

    " Git fugitive    
    Plug 'tpope/vim-fugitive'

    " Airline status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Fancy start screen with recent files
    Plug 'mhinz/vim-startify'

    " Color schemes
    Plug 'christianchiarulli/nvcode-color-schemes.vim'

    " Better highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Dev icons
    Plug 'ryanoasis/vim-devicons'

    " Simplenote integration in vim
    Plug 'simplenote-vim/simplenote.vim'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
