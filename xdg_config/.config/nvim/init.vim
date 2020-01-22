set shell=/bin/bash
let g:neoterm_shell='/usr/local/bin/fish'

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
Plug 'Shougo/context_filetype.vim'
Plug 'mtth/scratch.vim'
Plug 'junegunn/gv.vim' " Siple git log viewer - <leader>gl
Plug 'fabi1cazenave/termopen.vim'
Plug 'kassio/neoterm'
Plug 'junegunn/goyo.vim'
Plug 'ludovicchabant/vim-gutentags'

Plug 'tpope/vim-fireplace',     { 'for': 'clojure' }
Plug 'kovisoft/paredit',        { 'for': 'clojure' }
Plug 'jgdavey/vim-blockle',     { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }
Plug 'noprompt/vim-yardoc',     { 'for': 'ruby' }
Plug 'tpope/vim-rails',         { 'for': 'ruby' }
Plug 'tpope/vim-bundler',       { 'for': 'ruby' }
Plug 'fatih/vim-go',            { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'dag/vim-fish',            { 'for': 'fish' }
Plug 'rhysd/vim-gfm-syntax',    { 'for': 'markdown' }
Plug 'junegunn/limelight.vim',  { 'for': 'markdown' }
Plug 'slim-template/vim-slim',  { 'for': 'slim' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'davidoc/taskpaper.vim'

" Typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescript.tsx'] }

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'typescript.tsx', 'css', 'less', 'scss',
  \         'json', 'graphql', 'yaml', 'html']
  \ }

" Completion
Plug 'Shougo/echodoc.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
  Plug 'ponko2/deoplete-fish'
  Plug 'Shougo/neco-vim'
  Plug 'fszymanski/deoplete-emoji'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'violetyk/neosnippet-rails'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-smartinput'

if uname == 'Darwin'
  Plug '/usr/local/opt/fzf'
elseif uname == 'Linux'
  Plug 'junegunn/fzf'
endif
Plug 'junegunn/fzf.vim'

if exists('$TMUX')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux'
endif

" Running tests
Plug 'janko/vim-test'
" vim-test strategies
  Plug 'benmills/vimux'
  Plug 'tpope/vim-dispatch'
  Plug 'radenling/vim-dispatch-neovim'


" File checkkers/linters
Plug 'neomake/neomake', { 'do': 'npm install -g eslint jsonlint' }

Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
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

" Add plugins to &runtimepath
call plug#end()
" }}}

" Settings {{{
set mouse=a
set noshowmode
set cmdheight=1
set langmenu=en_US.UTF-8                " sets the language of the menu
set nowrap                              " Do not wrap long lines
set textwidth=80
set colorcolumn=+1                      " Display margin at 81
set number                              " Show linenumbers
set scrolloff=5
set sidescroll=1
set sidescrolloff=2
set hidden                              " Edited files can be in hidden buffers
" set bufhidden=hide
set splitright                          " New split window on the right
set splitbelow                          " New split window on the bottom
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ignorecase
set smartcase
set diffopt+=iwhite                     " Ignore whitespace on diffs
set virtualedit+=block                  " Allow to move the cursor everywhere,
set list                                " Show invisible characters not just existing text
set listchars=tab:⇥\ ,trail:·,extends:❯,precedes:❮
set fillchars=diff:⣿,vert:│,eob:\       " Comment needed to allow empty eob char
set conceallevel=2 concealcursor=nc     " Don't show hidden characters in normal mode
set complete+=kspell
set cursorline
set foldenable
set foldlevel=999999
set foldlevelstart=10
set foldtext=folding#text()
set completeopt=longest,menuone,preview,noselect
set pumheight=10
set clipboard+=unnamedplus
if exists('$TMUX')
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
endif
let mapleader = ","
let maplocalleader = "\\"
" }}}

" Look & feel {{{
set termguicolors
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
" Make it easier to to spot the current paren
hi MatchParen cterm=bold ctermbg=none ctermfg=yellow
" Hilight the line number of the cursorline
hi clear ColorColumn
hi ColorColumn ctermbg=234 guibg=#1d2021
hi VertSplit ctermbg=234 guibg=#1d2021
hi EndOfBuffer  ctermbg=234 guibg=#1d2021
hi clear CursorLine
hi CursorLine ctermbg=234 guibg=#1d2021
hi clear CursorLineNr
hi CursorLineNr cterm=bold ctermbg=234 ctermfg=Yellow guibg=#1d2021
" Make the search highlights a bit less intrusive
hi Search cterm=underline,bold ctermfg=Yellow

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'component': {
    \   'lineinfo': '%l:%v',
    \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', 'spell' ],
    \             [ 'gitbranch' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'filetype' ] ]
    \ },
    \ 'component_function': {
    \    'filename': 'LightLineFilename',
    \    'gitbranch': 'LightlineFugitive'
    \ }
    \ }

let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'V-L',
    \ "\<C-v>": 'V-B',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'S-L',
    \ "\<C-s>": 'S-B',
    \ 't': 'T',
    \ }
" Component functions {{{
function! LightLineFilename()
  return expand('%')
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction
" }}}
" }}}

" Mappings: General {{{
" Select last changed text (including pasted text)
nnoremap gp `[v`]

" Save and close the current buffer
nnoremap zz :write\|bdelete<CR>

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

" Run commands
nnoremap <leader><leader> :!

" Edit and source vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Open location-list and quickfix list
nnoremap <leader>lo :lwindow<CR>
nnoremap <leader>co :cwindow<CR>


" Wrapping words/selections with (, [, {, ", ', ', ", }, ], )
" Using vim-surround
nmap <leader>( viWS(
vmap <leader>( S(
nmap <leader>) viWS)
vmap <leader>) S)

nmap <leader>[ viWS[
vmap <leader>[ S[
nmap <leader>] viWS]
vmap <leader>] S]

nmap <leader>{ viWS{
vmap <leader>{ S{
nmap <leader>} viWS}
vmap <leader>} S}

nmap <leader>" viwS"
vmap <leader>" S"
nmap <leader>' viwS'
vmap <leader>' S'

" Shorcut for quick substitution
nnoremap <leader>s :%s//gc<left><left><left>
vnoremap <leader>s :%s/<c-r>//gc<left><left><left>

" Remove selected hightlight
noremap <leader><space> :nohlsearch<cr>:call clearmatches()<cr>:echo 'Search cleared'<CR>

" tab openning and closing
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>o :only<CR>

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
nnoremap <leader>F :grep! <C-r><C-w><CR>

" Tab navigation
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

" Scrolling
nnoremap <C-e> 2<C-y>
nnoremap <C-d> 2<C-e>

" Quick filename completion
inoremap <c-f> <c-x><c-f>
" Upcase last word
inoremap <C-u> <esc>gUiwea
" }}}

" Mappings: Folding {{{
" Use ,z to "focus" the current fold.
nnoremap zf zMzvzz
" Space to toggle folds.
nnoremap <Space> za
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
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow
  " Open quickfix always on the bottom
  autocmd FileType qf wincmd J
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

" Autocommands: Focus {{{
augroup focus_autocommands
  autocmd!
  autocmd BufEnter,FocusGained,VimEnter,WinEnter *
        \ set winhighlight= |
        \ let &l:colorcolumn = ('+' . join(range(1,255), ',+'))
  autocmd FocusLost,WinLeave *
        \ set winhighlight=Normal:ColorColumn,NormalNC:ColorColumn,SignColumn:ColorColumn
augroup END
" }}}

" Terminal {{{
augroup TermExtra
  autocmd!
  autocmd TermOpen * setlocal nonumber
  " autocmd BufEnter term://* setlocal nonumber
  " autocmd BufEnter term://* start!
  autocmd FileType neoterm tnoremap <silent> <buffer> <leader><Esc> <C-\><C-N>
  autocmd FileType neoterm nmap <silent> <buffer> q :quit!<CR>
augroup end
" }}}

" Plugin: Deoplete {{{
let g:deoplete#enable_at_startup = 1
" Insert the actual emoji
call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])

" <C-h>, <BS>: close popup and delete backword char.
imap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
imap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
" }}}

" Plugin: LanguageClient {{{
let g:LanguageClient_hoverPreview = 'Always'
let g:LanguageClient_diagnosticsEnable = 1
let g:LanguageClient_diagnosticsList = 'Disabled'
let g:LanguageClient_selectionUI = 'fzf'
let g:LanguageClient_serverCommands = {}

if executable('solargraph')
  " If I want to use solargraph I have to symlink it to the $PATH
  " let g:LanguageClient_serverCommands['ruby'] = ['tcp://127.0.0.1:7658']
  let g:LanguageClient_serverCommands['ruby'] = [exepath('solargraph'), 'stdio']
endif

if executable('typescript-language-server')
  let s:ts=[exepath('typescript-language-server'), '--stdio']

  let g:LanguageClient_serverCommands['javascript'] = s:ts
  let g:LanguageClient_serverCommands['typescript.tsx'] = s:ts
  let g:LanguageClient_serverCommands['typescript'] = s:ts
endif
" if executable('javascript-typescript-stdio')
"   let s:js=[exepath('javascript-typescript-stdio')]

"   let g:LanguageClient_serverCommands['javascript'] = s:js
"   let g:LanguageClient_serverCommands['typescript.tsx'] = s:js
"   let g:LanguageClient_serverCommands['typescript'] = s:js
" endif

let g:LanguageClient_rootMarkers = {
    \ 'ruby': ['Gemfile', '.ruby-version'],
    \ }

function! LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <localleader>R :call LanguageClient_textDocument_references()<CR>
    nnoremap <buffer> <silent> <localleader>C :call LanguageClient_contextMenu()<CR>

    setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
  endif
endfunction

augroup plugin_language_client
  autocmd!
  autocmd FileType * call LC_maps()
  autocmd User LanguageClientStarted echom '[LC] Started'
  autocmd User LanguageClientStopped echom '[LC] Stopped'

  " Start Ruby LSP server (solargraph) in tmux pane
  autocmd FileType ruby nnoremap <buffer> <localleader>tsg :call solargraph#startInTmux()<CR>:e<CR>
  autocmd FileType ruby nnoremap <buffer> <localleader>ss :LanguageClientStop<CR>
  autocmd FileType ruby nnoremap <buffer> <localleader>ru :Dispatch bundle exec rubocop<CR>
augroup END
" }}}

" Plugin: Eunuch {{{
cabbrev rename Rename
cabbrev move Move
cabbrev mkdir Mkdir!
" }}}

" Plugin: Prettier {{{
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0

augroup custom_prettier
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync
augroup END
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
noremap  <silent> <leader>gl :GV<CR>
noremap <silent> <leader>dg :diffget<CR>
noremap <silent> <leader>dp :diffput<CR>
" }}}

" Plugin: FZF {{{
noremap <C-p> :FZF<CR>
noremap <C-n> :FZF --no-sort --inline-info ~/Documents/Notable/notes<CR>
" noremap <C-n> :call fzf#run(fzf#wrap({
"       \   'source': 'ls ~/Documents/Notable/notes'
"       \ , 'sink': 'vsp'
"       \ , 'dir': '~/Documents/Notable/notes'
"       \ , 'down': '25%'
"       \ }))<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
noremap <leader>B :Buffers <CR>
noremap <leader>C :Commands <CR>
noremap <leader>T :Tags <CR>
noremap <leader>H :Helptags <CR>

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
imap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --layout=reverse'

  function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)

    " here be dragoons
    let height = float2nr(&lines / 2)
    let width = float2nr(&columns / 2)
    let opts = {
          \ 'relative': 'editor',
          \ 'row': float2nr((&lines - height) / 2),
          \ 'col': float2nr((&columns - width) / 2),
          \ 'width': width,
          \ 'height': height,
          \ 'style': 'minimal'
          \ }

    let win = nvim_open_win(buf, v:true, opts)
   " uncomment this if you want a normal background color for the fzf window
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
    " call setwinvar(win, '&winhl', 'NormalFloat:Pmenu')

  " this is to remove all line numbers and so on from the window
    setlocal
          \ buftype=nofile
          \ nobuflisted
          \ bufhidden=hide
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" }}}

" Plugin: vim-test {{{
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

nmap t<C-n> :TestNearest<CR>
nmap t<C-f> :TestFile<CR>
nmap t<C-s> :TestSuite<CR>
nmap t<S-n> :TestNearest -strategy=vimux<CR>
nmap t<S-f> :TestFile -strategy=vimux<CR>
nmap t<S-s> :TestSuite -strategy=vimux<CR>

function! RunInBashTransform(cmd) abort
  return "bash --login -c '".a:cmd."'"
endfunction

let g:test#custom_transformations = {
  \ 'bash': function('RunInBashTransform'),
  \ }
" let g:test#transformation = 'bash'
let test#strategy = {
  \ 'nearest': 'dispatch',
  \ 'file':    'dispatch',
  \ 'suite':   'dispatch',
  \ }
let test#ruby#rspec#options = '--format progress'
" }}}

" Plugin: vim-dispatch {{{
" When Dispatch tries to recognize the compiler plugin it matches the command
" with makeprg name. Some commands have prefixes that prevent the proper
" matching.
let g:dispatch_compilers = {
  \ 'bash --login -c ': '',
  \ }
" }}}

" Plugin: Vimux {{{
function! VimuxSlime()
  call VimuxSendKeys("q C-u")
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" Helps to interact with tmux
let g:VimuxUseNearestPane = 1
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vc :VimuxCloseRunner<CR>
nnoremap <Leader>vz :VimuxZoomRunner<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
vnoremap <Leader>vs "vy :call VimuxSlime()<CR>
nnoremap <Leader>vs vip<LocalLeader>vs<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
" }}}

" Plugin: neosnippet {{{
let g:neosnippet#snippets_directory = fnamemodify(expand("$MYVIMRC"), ":p:h") . "/snippets/"
let g:neosnippet#enable_completed_snippet = 1
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
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
call neomake#configure#automake('rw', 250)
" let g:neomake_open_list = 1
" let g:neomake_list_height = 5

" Defaults: ['mri', 'rubocop', 'reek', 'rubylint']
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
" }}}

" Plugin: GoldenRatio {{{
" Turn the plugin off by default
let g:golden_ratio_autocommand = 0
" Try to follow conventions from vim-unimpaired
nnoremap [og :GoldenRatioToggle <CR>
nnoremap ]og :GoldenRatioToggle <CR>
" }}}

" Plugin: Scratch {{{
let g:scratch_insert_autohide = 0
let g:scratch_height = 20
let g:scratch_persistence_file = '~/scratch.md'
" }}}

" Plugin: vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=234 guibg=#1d2021
hi IndentGuidesEven ctermbg=234 guibg=#1d2021
" }}}

" Plugin: termopen {{{
nmap <Leader>gt :call TermOpen('tig', 't')<CR>
" }}}

" Plugin: Goyo {{{
let g:goyo_width = 100
function! s:goyo_enter()
  set nocursorline
  call indent_guides#disable()
  hi clear ColorColumn
  hi clear VertSplit
  hi clear EndOfBuffer
endfunction

function! s:goyo_leave()
  set cursorline
  call indent_guides#enable()
  hi clear ColorColumn
  hi ColorColumn ctermbg=234 guibg=#1d2021
  hi VertSplit ctermbg=234 guibg=#1d2021
  hi EndOfBuffer  ctermbg=234 guibg=#1d2021
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" Plugin: Markdown {{{
let g:markdown_fenced_languages = ['yaml', 'ruby', 'json', 'sh', 'javascript']
augroup markdown_settings
  autocmd!
  autocmd  FileType markdown setlocal wrap linebreak breakindent
  autocmd  FileType markdown setlocal formatoptions=ln
augroup END
" }}}

" Plugin: Limelight {{{
" TODO: Fix the colors and soft wrapping
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
" }}}

" Plugin: Gutentags {{{
let g:gutentags_ctags_exclude = ['vendor/*', 'tmp/*', 'log/*', 'coverage/*', 'doc/*']
" }}}
