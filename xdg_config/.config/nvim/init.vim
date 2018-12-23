set shell=/bin/bash

let uname = substitute(system('uname'), '\n', '', '')
if uname == 'Darwin'
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
elseif uname == 'Linux'
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
endif

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'roman/golden-ratio'
Plug 'vimwiki/vimwiki'
Plug 'Shougo/context_filetype.vim'

Plug 'tpope/vim-fireplace',     { 'for': 'clojure' }
Plug 'kovisoft/paredit',        { 'for': 'clojure' }
Plug 'jgdavey/vim-blockle',     { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }
Plug 'noprompt/vim-yardoc',     { 'for': 'ruby' }
Plug 'tpope/vim-rails',         { 'for': 'ruby' }
Plug 'tpope/vim-bundler',       { 'for': 'ruby' }
Plug 'fatih/vim-go',            { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'dag/vim-fish',            { 'for': 'fish' }

" Typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
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

Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-smartinput'

if uname == 'Darwin'
  Plug '/usr/local/opt/fzf'
elseif uname == 'Linux'
  Plug 'junegunn/fzf'
endif
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

" Running tests
" https://github.com/neovim/neovim/issues/2048#issuecomment-98307896
Plug 'benmills/vimux'
" Plug 'tpope/vim-dispatch'
" Plug 'radenling/vim-dispatch-neovim'
Plug 'jgdavey/vim-turbux'

" File checkkers/linters
" Plug 'neomake/neomake', { 'do': 'npm install -g eslint jsonlint' }

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'

Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-sneak'
Plug 'sjl/gundo.vim'

" Add plugins to &runtimepath
call plug#end()
" }}}

" Settings {{{
set noshowmode
set cmdheight=1
set langmenu=en_US.UTF-8                " sets the language of the menu
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
set virtualedit+=block                  " Allow to move the cursor everywhere,
set list                                " Show invisible characters not just existing text
set listchars=tab:⇥\ ,trail:·,extends:❯,precedes:❮
set fillchars=diff:⣿,vert:│,eob:\
set conceallevel=2 concealcursor=n      " Don't show hidden characters in normal mode
set complete+=kspell
set tags+=./.git/tags
set cursorline
set foldenable
set foldmethod=syntax
set foldlevel=999999
set foldlevelstart=10
set foldtext=folding#text()
set clipboard+=unnamedplus
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'tmux load-buffer -',
      \      '*': 'tmux load-buffer -',
      \    },
      \   'paste': {
      \      '+': 'tmux save-buffer -',
      \      '*': 'tmux save-buffer -',
      \   },
      \   'cache_enabled': 1,
      \ }
let mapleader = ","
let maplocalleader = "\\"
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
" }}}

" Mappings: General {{{
" Edit and source vimrc file
nnoremap <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<cr>

nnoremap <leader><leader> :!

" Shorcut for quick substitution
nnoremap <leader>s :%s//gg<left><left><left>
vnoremap <leader>s :%s/<c-r>//gg<left><left><left>

" Remove selected hightlight
noremap <leader><space> :nohlsearch<cr>:call clearmatches()<cr>:echo 'Search cleared'<CR>

" Easier linewise reselection
nnoremap <leader>v V`]

" tab openning and closing
noremap <leader>tc :tabclose<CR>
noremap <leader>tn :tabnew<CR>
noremap <leader>to :tabonly<CR>
noremap <leader>o :only<CR>

" Shortcut for Gundo
nnoremap <silent> <leader>u :GundoToggle<CR>

" Quickly diffing to panes
nnoremap <leader>dt :windo diffthis<CR>
nnoremap <leader>du :windo diffupdate<CR>
nnoremap <leader>do :windo diffoff<CR>

" Comment out lines with Commentarney
nmap <leader>/ <Plug>CommentaryLine
xmap <leader>/ <Plug>Commentary
omap <leader>/ <Plug>Commentary

" Quickly search
nnoremap <leader>A :lgrep! "FIXME\\|TODO"<CR>
nnoremap <leader>F :lgrep! <C-r><C-w><CR>

" tab navigation
nnoremap <TAB> gt
nnoremap <S-TAB> gT

" Save with simpler keystroke
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Window resizing
nnoremap <S-C-left> 5<c-w>>
nnoremap <S-C-right> 5<c-w><
nnoremap <S-C-up> 5<c-w>+
nnoremap <S-C-down> 5<c-w>-
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Don't move on *
nnoremap * *Nzzzv
" Keep search matches in the middle of the window and pulse the line when moving to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Go by visual lines (happens when lines are wrapped)
nnoremap k gk
nnoremap j gj

" Quick filename completion
inoremap <c-f> <c-x><c-f>
" Upcase last word
inoremap <C-u> <esc>gUiwea

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO
" }}}

" Mappings: Command-line {{{
" Some helpers to edit mode http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>
" }}}

" Autocommands: General {{{
" Open quickfix window when it's populated
augroup custom_autocommands
  autocmd!
  autocmd QuickFixCmdPost grep* cwindow
  autocmd QuickFixCmdPost lgrep* lwindow
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
augroup END
" }}}

" Autocommands: Folding {{{
augroup folding_autocommands
  autocmd!
  " Don't screw up folds when inserting text that might affect them, until leaving
  " insert mode. Foldmethod is local to the window. Protect against screwing up
  " folding when switching between windows.
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END
" }}}

" Terminal {{{
tnoremap <leader><Esc> <C-\><C-n>
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<cr>

augroup TermExtra
  autocmd!
  autocmd BufEnter term://* setlocal nonumber
  autocmd BufEnter term://* start!
augroup end
" }}}

" Plugin: Eunuch {{{
cabbrev rename Rename
cabbrev move Move
cabbrev mkdir Mkdir!
" }}}

" Plugin: Prettier {{{
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
" }}}

" Plugin: Fugitive {{{
cabbrev git Git
" Open file for diff in new tab and jump to the first change
nnoremap <leader>gd <C-w>s<C-w>T:Gdiff<cr>zRgg]c
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
" }}}

" Plugin: FZF {{{
cabbrev maps Maps
noremap <C-p> :FZF<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
noremap <leader>b :Buffers <CR>
noremap <leader>c :Commands <CR>
noremap <leader>ta :Tags <CR>
noremap <leader>h :Helptags <CR>

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
imap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}

" Plugin: Trubux {{{
" Turbo Ruby testing with tmux
let g:turbux_runner = 'vimux'
let g:no_turbux_mappings = 1
let g:turbux_command_prefix = 'clear; bundle exec'
noremap <leader>m <Plug>SendTestToTmux
noremap <leader>M <Plug>SendFocusedTestToTmux
" }}}

" Plugin: Vimux {{{
function! VimuxSlime()
  call VimuxSendKeys("q C-u")
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" Helps to interact with tmux
let g:VimuxUseNearestPane = 1
nnoremap <LocalLeader>vp :VimuxPromptCommand<CR>
nnoremap <LocalLeader>vc :VimuxCloseRunner<CR>
nnoremap <LocalLeader>vz :VimuxZoomRunner<CR>
nnoremap <LocalLeader>vi :VimuxInspectRunner<CR>
vnoremap <LocalLeader>vs "vy :call VimuxSlime()<CR>
nnoremap <LocalLeader>vs vip<LocalLeader>vs<CR>
nnoremap <Leader>l :VimuxRunLastCommand<CR>
" }}}

" Plugin: neosnippet {{{
let g:neosnippet#snippets_directory = fnamemodify(expand("$MYVIMRC"), ":p:h") . "/snippets/"
let g:neosnippet#enable_completed_snippet = 1
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
inoremap <C-k>     <Plug>(neosnippet_expand_or_jump)
snoremap <C-k>     <Plug>(neosnippet_expand_or_jump)
xnoremap <C-k>     <Plug>(neosnippet_expand_target)
cabbrev snipe NeoSnippetEdit
" }}}

" Plugin: vim-go {{{
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" }}}

" Plugin: NeoMake {{{
" " au! BufWritePost * Neomake
" call neomake#configure#automake('nrw', 1000)
" " let g:neomake_open_list = 1
" " let g:neomake_list_height = 5

" " Defaults: ['mri', 'rubocop', 'reek', 'rubylint']
" let g:neomake_ruby_enabled_makers = []
" let g:neomake_javascript_enabled_makers = ['eslint']
" }}}

" Plugin: GoldenRatio {{{
" Turn the plugin off by default
let g:golden_ratio_autocommand = 0
" Try to follow conventions from vim-unimpaired
nnoremap [og :GoldenRatioToggle <CR>
nnoremap ]og :GoldenRatioToggle <CR>
" }}}
