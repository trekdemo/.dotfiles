" =[ Plugins ]==================================================================
call plug#begin('~/.config/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'mkarmona/materialbox'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'tpope/vim-fireplace',     { 'for': 'clojure' }
Plug 'kovisoft/paredit',        { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen',     { 'for': 'clojure' }
Plug 'tpope/vim-classpath',     { 'for': 'clojure' }
Plug 'losingkeys/vim-niji',     { 'for': 'clojure' }
Plug 'jgdavey/vim-blockle',     { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }

Plug 'kana/vim-smartinput'
Plug 'plasticboy/vim-markdown'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-vinegar'

Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-sneak'
Plug 'sjl/gundo.vim'
Plug 'sjl/vitality.vim'

Plug 'danro/rename.vim'

" Add plugins to &runtimepath
call plug#end()

" =[ Settings ]=================================================================
colorscheme PaperColor
let g:lightline = { 'colorscheme': 'PaperColor' }

set clipboard+=unnamedplus
set nowrap                              " Do not wrap long lines
set textwidth=80
set colorcolumn=+1                      " Display margin at 81
set number                              " Show linenumbers
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
set nohidden                            " Modified buffers can't be hidden
set splitright                          " New split window on the right
set splitbelow                          " New split window on the bottom
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set diffopt+=iwhite                     " Ignore whitespace on diffs
set list                                " Show invisible characters
set listchars=tab:·\ ,trail:·,eol:¬,extends:❯,precedes:❮
set fillchars=diff:⣿,vert:\|
" Allow to move the cursor everywhere, not just existing text
set virtualedit+=block
set completeopt=longest,menuone,preview

" =[ Mappings ]================================================================
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

let mapleader = ","
let maplocalleader = "\\"

" Leader mappings {{{
nmap <leader><leader> :!

" Shorcut for quick substitution
nnoremap <leader>s :%s//gg<left><left><left>

" Remove selected hightlight
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Easier linewise reselection
nnoremap <leader>v V`]

" Adjust viewports to the same size
map <Leader>= <C-w>=

" tab navigation
nnoremap <TAB> gt
nnoremap <S-TAB> gT

" Use ,z to "focus" the current fold.
nnoremap      <leader>z zMzvzz

" tab openning and closing
map <leader>tc :tabclose<CR>
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>o :only<CR>

" Quick filename completion
inoremap <c-f> <c-x><c-f>

" Shortcut for Gundo
nmap <silent> <leader>u :GundoToggle<CR>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_


" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Quickly diffing to panes
nnoremap <leader>dt :windo diffthis<CR>
nnoremap <leader>du :windo diffupdate<CR>
nnoremap <leader>do :windo diffoff<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Scroll faster
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Change case
" nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" =[ Fugitive ]=================================================================
  cabbrev git Git
  nnoremap <leader>gd :Gdiff<cr>
  nnoremap <leader>gs :Gstatus<cr>
  nnoremap <leader>gw :Gwrite<cr>
  nnoremap <leader>ga :Gadd<cr>
  nnoremap <leader>ge :Gedit<cr>
  nnoremap <leader>gb :Gblame<cr>
  nnoremap <leader>gco :Gcheckout<cr>
  nnoremap <leader>gci :Gcommit<cr>
  nnoremap <leader>gr :Gremove<cr>
  nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>

  " nnoremap <leader>gp :Git push<cr>
  nnoremap <leader>gps :Dispatch! git push<CR>
  nnoremap <leader>gpl :Dispatch! git pull<CR>

  augroup ft_fugitive
      au!
      au BufNewFile,BufRead .git/index setlocal nolist spell
  augroup END

" =[ commentary.vim ]===========================================================
  map <leader>/ gcc
  imap <leader>/ gc

" =[ FZF ]======================================================================
map <C-p> :FZF<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
