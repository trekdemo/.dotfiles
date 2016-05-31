let g:python3_host_prog = '/usr/local/bin/python3'

" =[ Plugins ]==================================================================
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'mkarmona/materialbox'

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Plug 'kassio/neoterm'

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
Plug 'tpope/vim-rails',         { 'for': 'ruby' }
Plug 'tpope/vim-bundler',       { 'for': 'ruby' }

Plug 'kana/vim-smartinput'
Plug 'plasticboy/vim-markdown'
Plug 'wannesm/wmgraphviz.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" https://github.com/neovim/neovim/issues/2048#issuecomment-98307896
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'

Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-sneak'
Plug 'sjl/gundo.vim'
Plug 'sjl/vitality.vim'

Plug 'danro/rename.vim'

" Add plugins to &runtimepath
call plug#end()

" =[ Settings ]=================================================================
colorscheme PaperColor
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction

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
set foldenable
set foldmethod=syntax
set foldlevel=999999
set foldlevelstart=10

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

" Window resizing
nnoremap <S-C-left> 5<c-w>>
nnoremap <S-C-right> 5<c-w><
nnoremap <S-C-up> 5<c-w>+
nnoremap <S-C-down> 5<c-w>-


" Don't move on *
nnoremap * *N
" Keep search matches in the middle of the window and pulse the line when moving to them.
nnoremap n nzzzv
nnoremap N Nzzzv

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
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Change case
" nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" tnoremap <Esc> <C-\><C-n>

" Folding ======================================================================
" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO


" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 7 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction " }}}
set foldtext=MyFoldText()

" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
autocmd BufWritePre <buffer> call <SID>StripTrailingWhitespaces()

" =[ Spell checking ]===========================================================
" Set spellfile to location that is guaranteed to exist
set spellfile=$HOME/.dotfiles/vim/vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
" Toggle spell checking with \s
nnoremap <silent> <localleader>s :setlocal spell!<CR>

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

" = [ GitGutter ] ==============================================================
nnoremap <localleader>gd :GitGutterLineHighlightsToggle<cr>


" =[ commentary.vim ]===========================================================
map <leader>/ gcc
imap <leader>/ gc

" =[ FZF ]======================================================================
map <C-p> :FZF<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" =[ The Silver Searcher ]======================================================
  map <leader>F :Ag!<space>
  map <leader>A :Ag "FIXME\|TODO"<CR>

" =[ Rails ]====================================================================
  cabbrev rake Rake
  cabbrev rails Rails
  cabbrev bundle Bundle
  cabbrev rmodel Rmodel
  cabbrev rcontroller Rcontroller
  cabbrev rmigration Rmigration

" =[ Turbux ]===================================================================
  let g:turbux_runner = 'vimux'
  let g:no_turbux_mappings = 1
  let g:turbux_command_prefix = 'clear;'
  map <leader>m <Plug>SendTestToTmux
  map <leader>M <Plug>SendFocusedTestToTmux

" =[ Vimux ]====================================================================
  let g:VimuxUseNearestPane = 1
  map <LocalLeader>vp :VimuxPromptCommand<CR>
  map <LocalLeader>vr :VimuxRunCommand("")<left><left>
  map <LocalLeader>vc :VimuxCloseRunner<CR>
  map <LocalLeader>vz :VimuxZoomRunner<CR>
  map <LocalLeader>vi :VimuxInspectRunner<CR>
  map <Leader>l :VimuxRunLastCommand<CR>

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" = [ deoplete ] ===============================================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}

