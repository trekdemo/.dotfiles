set shell=/bin/bash

let uname = substitute(system('uname'), '\n', '', '')
if uname == 'Darwin'
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
elseif uname == 'Linux'
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
endif

" =[ Plugins ]==================================================================
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'roman/golden-ratio'
Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-fireplace',     { 'for': 'clojure' }
Plug 'kovisoft/paredit',        { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen',     { 'for': 'clojure' }
Plug 'tpope/vim-classpath',     { 'for': 'clojure' }
Plug 'losingkeys/vim-niji',     { 'for': 'clojure' }
Plug 'jgdavey/vim-blockle',     { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }
Plug 'noprompt/vim-yardoc',     { 'for': 'ruby' }
Plug 'tpope/vim-rails',         { 'for': 'ruby' }
Plug 'tpope/vim-bundler',       { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop',        { 'for': 'ruby' }
Plug 'fatih/vim-go',            { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Typescript
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'typescript.tsx', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }

" Completion
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'Shougo/echodoc.vim'
 " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"   Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
"   Plug 'fishbullet/deoplete-ruby'
"   Plug 'ponko2/deoplete-fish'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-smartinput'
Plug 'dag/vim-fish'
Plug 'kevinhui/vim-docker-tools'


if uname == 'Darwin'
  Plug '/usr/local/opt/fzf'
elseif uname == 'Linux'
  Plug 'junegunn/fzf'
endif
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'roxma/vim-tmux-clipboard'

" Running tests
" https://github.com/neovim/neovim/issues/2048#issuecomment-98307896
Plug 'benmills/vimux'
" Plug 'tpope/vim-dispatch'
" Plug 'radenling/vim-dispatch-neovim'
Plug 'jgdavey/vim-turbux'

" File checkkers/linters
" Plug 'neomake/neomake', { 'do': 'npm install -g eslint jsonlint' }

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'

Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-sneak'
Plug 'sjl/gundo.vim'
Plug 'sjl/vitality.vim'

Plug 'danro/rename.vim'

" Add plugins to &runtimepath
call plug#end()

" =[ Settings ]=================================================================
set noshowmode
set cmdheight=1
set langmenu=en_US.UTF-8    " sets the language of the menu

" set cursorline

set background=dark
try
  colorscheme gruvbox
  let g:gruvbox_italic=1
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \    'filename': 'LightLineFilename',
    \    'cocstatus': 'coc#status'
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
set fillchars=diff:⣿,vert:│
" Allow to move the cursor everywhere, not just existing text
set virtualedit+=block

if has('nvim-0.3.1')
  set fillchars+=eob:\              " suppress ~ at EndOfBuffer
endif

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
map <leader>pc :q<CR>

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

" Scroll faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Change case
" nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Create directory if it does not exists
function! s:Mkdir()
  let dir = expand('%:p:h')

  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction

autocmd BufWritePre * call s:Mkdir()

" =[ Spell checking ]===========================================================
" Set spellfile to location that is guaranteed to exist
set spellfile=$HOME/.dotfiles/vim/vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

autocmd QuickFixCmdPost *grep* cwindow

autocmd BufRead,BufNewFile *.md setlocal spell
" Toggle spell checking with \s
nnoremap <silent> <localleader>s :setlocal spell!<CR>

" =[ Prettier ]=================================================================
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

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
map <leader>b :Buffers <CR>
map <leader>c :Commands <CR>
map <leader>ta :Tags <CR>

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" =[ The Silver Searcher ]======================================================
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Overwrite the Ag command in FZF.vim
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif

map <leader>A :grep "FIXME\|TODO"<CR>
nmap <leader>F :grep <C-r><C-w><CR>

" =[ Rails ]====================================================================
cabbrev rake Rake
cabbrev rails Rails
cabbrev rmodel Rmodel
cabbrev rcontroller Rcontroller
cabbrev rmigration Rmigration

" =[ Turbux ]===================================================================
" Turbo Ruby testing with tmux
let g:turbux_runner = 'vimux'
" let g:turbux_runner = 'dispatch'
let g:no_turbux_mappings = 1
let g:turbux_command_prefix = 'clear; bundle exec'
map <leader>m <Plug>SendTestToTmux
map <leader>M <Plug>SendFocusedTestToTmux

" =[ Vimux ]====================================================================
function! VimuxSlime()
  call VimuxSendKeys("q C-u")
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" Helps to interact with tmux
let g:VimuxUseNearestPane = 1
nmap <LocalLeader>vp :VimuxPromptCommand<CR>
nmap <LocalLeader>vr :VimuxRunCommand("")<left><left>
nmap <LocalLeader>vc :VimuxCloseRunner<CR>
nmap <LocalLeader>vz :VimuxZoomRunner<CR>
nmap <LocalLeader>vi :VimuxInspectRunner<CR>
vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>
nmap <LocalLeader>vs vip<LocalLeader>vs<CR>
nmap <Leader>l :VimuxRunLastCommand<CR>

" = [ neosnippet ] =============================================================
let g:neosnippet#enable_completed_snippet = 1
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=n
endif

" = [ vim-go ] =================================================================
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Open go doc in vertical window, horizontal, or tab
autocmd Filetype go nmap <leader>m  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" " = [NeoMake ] =================================================================
" " au! BufWritePost * Neomake
" call neomake#configure#automake('nrw', 1000)
" " let g:neomake_open_list = 1
" " let g:neomake_list_height = 5

" " Defaults: ['mri', 'rubocop', 'reek', 'rubylint']
" let g:neomake_ruby_enabled_makers = []
" let g:neomake_javascript_enabled_makers = ['eslint']

" = [GoldenRatio] ==============================================================
" Turn the plugin off by default
let g:golden_ratio_autocommand = 0
" Try to follow conventions from vim-unimpaired
nnoremap [og :GoldenRatioToggle <CR>
nnoremap ]og :GoldenRatioToggle <CR>

" = [operator-flashy] ==========================================================
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$


" = [Useful snippets] ==========================================================
iabbrev bpry require 'pry'; binding.pry;
autocmd FileType help nnoremap q :q<cr>
