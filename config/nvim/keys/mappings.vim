" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
" nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
" nnoremap <S-TAB> :bprevious<CR>
" Close buffer easily
" nmap <leader>q :bp <BAR> bd #<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better page up/down behaviour
map <PageDown> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>
map <PageUp> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" FZF
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>g :Ag<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

" Cancel the default behavior of putting
" text they delete in the default register.
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C

" Paste over without overwriting register
vnoremap p "_dP

" Move block up/down with autoindent
nnoremap K :<C-u>silent! move-2<CR>==
nnoremap J :<C-u>silent! move+<CR>==
xnoremap K :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap J :<C-u>silent! '<,'>move'>+<CR>gv=gv

" Better indenting, highlight again after each indent.
vnoremap < <gv
vnoremap > >gv
