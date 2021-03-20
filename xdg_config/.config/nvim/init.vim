let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path .
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

set shell=/bin/zsh
let g:neoterm_shell='/usr/local/bin/fish'
let g:python3_host_prog = '/usr/bin/python3'

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'gruvbox-community/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'justinmk/vim-sneak'
Plug 'kevinhwang91/nvim-bqf'

Plug 'roman/golden-ratio'
Plug 'Shougo/context_filetype.vim'
Plug 'junegunn/gv.vim' " Simple git log viewer - <leader>gl
Plug 'fabi1cazenave/termopen.vim'
Plug 'kassio/neoterm'
Plug 'godlygeek/tabular'

Plug 'sheerun/vim-polyglot'

Plug 'fatih/vim-go',            { 'for': 'go' }
Plug 'jgdavey/vim-blockle',     { 'for': 'ruby' }
Plug 'junegunn/goyo.vim',       { 'for': ['markdown', 'text', 'help'] }
Plug 'noprompt/vim-yardoc',     { 'for': 'ruby' }
Plug 'tpope/vim-bundler',       { 'for': 'ruby' }
Plug 'tpope/vim-rails',         { 'for': 'ruby' }
Plug 'vim-scripts/bash-support.vim'
Plug 'vimwiki/vimwiki'

" Typescript
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'typescript.tsx', 'css', 'less', 'scss',
  \         'json', 'graphql', 'yaml', 'html', 'markdown']
  \ }

Plug 'ncm2/float-preview.nvim' " Display *preview-window* as a floating window.
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'violetyk/neosnippet-rails'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-smartinput'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

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

" File checkers/linters
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
Plug 'tpope/vim-abolish'

Plug 'justinmk/vim-gtfo'

" Add plugins to &runtimepath
call plug#end()
if plug_install
    PlugInstall --sync
endif
unlet plug_install
" }}}

" Settings {{{
set spell
set mouse=a
set noshowmode
set cmdheight=1
set langmenu=en_US.UTF-8                " sets the language of the menu
set nowrap                              " Do not wrap long lines
set textwidth=80
set colorcolumn=+1                      " Display margin at 81
set number                              " Show line numbers
set numberwidth=6
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
set diffopt=filler,internal,algorithm:histogram,indent-heuristic,iwhite
set virtualedit+=block                  " Allow to move the cursor everywhere,
set list                                " Show invisible characters not just existing text
set listchars=tab:⇥\ ,trail:·,extends:❯,precedes:❮
set fillchars=diff:⣿,vert:│,eob:\       " Comment needed to allow empty eob char
set conceallevel=2 concealcursor=nc     " Don't show hidden characters in normal mode
set inccommand=nosplit                  " Show substitution in realtime
set complete+=kspell
set cursorline
set foldenable
set foldlevel=999999
set foldlevelstart=10
set foldtext=folding#text()
set completeopt=menuone,noinsert,noselect,preview
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
augroup SwitchBackgroundColors
    autocmd!
    autocmd ColorSchemePre papercolor set background=light
    autocmd ColorSchemePre gruvbox    set background=dark
    autocmd ColorScheme    *          hi Normal guibg=NONE ctermbg=NONE
                                  \ | hi EndOfBuffer guibg=NONE ctermbg=NONE
    autocmd ColorScheme    *          call s:lightline_update()
augroup END
function! s:lightline_update()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    let g:lightline.colorscheme = substitute(g:colors_name, '-', '_', 'g')
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  catch
  endtry
endfunction

source ~/.vimrc_background

let g:lightline = {
    \ 'colorscheme': g:colors_name,
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

" Plugin: LSP {{{
" Use completion-nvim in every buffer
autocmd BufEnter * :lua require'completion'.on_attach()
lua require 'lsp_config'
let g:completion_enable_snippet = 'Neosnippet'
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = {
	    \ 'default' : {
	    \   'default': [
	    \       {'complete_items': ['lsp', 'snippet']},
	    \       {'complete_items': ['path'], 'triggered_only': ['/']},
	    \       {'mode': '<c-p>'},
	    \       {'mode': '<c-n>'}],
	    \   'comment': [
	    \       {'complete_items': ['dict', 'spel', 'thes']},
	    \       {'mode': '<c-p>'},
	    \       {'mode': '<c-n>'},
      \   ]
	    \ }
	    \}
" }}}

" Mappings: General {{{
" Keep the previous clipboard value
vnoremap p "_dP
" Paste without overwriting default register (doesn't work with other registers)
xnoremap p pgvy
" Alt + Backspace should delete the last word
inoremap <A-BS> <C-W>

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

" Tab openning and closing
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnew<CR>

" Window splitting and closing
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
nnoremap sc :write<CR>:close<CR>
nnoremap gF :e <cfile><cr>

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

" Window resizing
nnoremap <C-left> 5<c-w>>
nnoremap <C-right> 5<c-w><
nnoremap <C-up> 5<c-w>+
nnoremap <C-down> 5<c-w>-

" Scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

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
  autocmd VimResized * wincmd =
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow
  " Open quickfix always on the bottom
  autocmd FileType qf wincmd J
  autocmd FileType qf setlocal wrap
augroup END

augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
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

" Plugin: termopen {{{
nmap <Leader>gt :call TermOpen('tig', 't')<CR>
nmap <Leader>r :call TermOpenRanger()<CR>
" }}}

" Terminal {{{
let g:neoterm_default_mod = 'vertical'
let g:neoterm_autojump = 1
let g:neoterm_autoinsert = 0

augroup TermExtra
  autocmd!
  autocmd TermOpen * setlocal nonumber scrolloff=0
  autocmd FileType neoterm nmap <silent> <buffer> q :quit!<CR>
augroup end


" Use gx{text-object} in normal mode
" nmap gr <Plug>(neoterm-repl-send)
" Send selected contents in visual mode.
" xmap gr <Plug>(neoterm-repl-send)

" Toggle neoterm pane
nmap <localleader>vv :Ttoggle<CR>
tmap <localleader>vv <c-\><c-n>:Ttoggle<CR>
" }}}

" Mappings: Navigation {{{
if !exists('$TMUX')
  nnoremap <C-h> <C-w><C-h>
  nnoremap <C-j> <C-w><C-j>
  nnoremap <C-k> <C-w><C-k>
  nnoremap <C-l> <C-w><C-l>
endif

tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
" I use <C-l> too much to clear the terminal
" tnoremap <C-l> <C-\><C-n><C-l>

tnoremap <C-u> <C-\><C-n><C-u>
tnoremap <C-d> <C-\><C-n><C-d>
" }}}

" Plugin: Echodoc {{{
" Or, you could use neovim's floating text feature.
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu"

" let g:echodoc#enable_at_startup = 1
" " let g:echodoc#type = 'floating'
" let g:echodoc#type = 'popup'
" " To use a custom highlight for the popup window,
" " change Pmenu to your highlight group
" highlight link EchoDocPopup Pmenu
" }}}

" Plugin: floating-preview.nvim {{{
set completeopt-=preview
let g:float_preview#docked = 0
let g:float_preview#max_width = 30
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
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html,*.md PrettierAsync
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
nnoremap <leader>gco :GBranches<cr>
nnoremap <leader>gci :Gcommit<cr>
noremap <silent> <leader>gl :GV<CR>
noremap <silent> <leader>dg :diffget<CR>
noremap <silent> <leader>dp :diffput<CR>
" }}}

" Plugin: FZF {{{
let $FZF_DEFAULT_OPTS .= ' --layout=reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

noremap <C-p> :GitFiles<CR>
noremap <M-C-p> :Ag<CR>
noremap <M-C-l> :Lines<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
noremap <leader>B :Buffers <CR>
noremap <leader>B :Buffers <CR>
noremap <C-b> :Buffers <CR>
noremap <leader>C :Commands <CR>
noremap <leader>T :Tags <CR>
noremap <localleader>t :BTags <CR>
noremap <leader>H :Helptags <CR>

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
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
" let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_complete_done = 1
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_or_jump)
nmap <C-k>     <Plug>(neosnippet_expand_or_jump)
autocmd InsertLeave * NeoSnippetClearMarkers
cabbrev snipe NeoSnippetEdit
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
nnoremap [og <Plug>(golden_ratio_toggle)
nnoremap ]og <Plug>(golden_ratio_toggle)
nnoremap [oc :set conceallevel=2 <CR>
nnoremap ]oc :set conceallevel=0 <CR>
" }}}

" Plugin: Goyo {{{
let g:goyo_width = 100
function! s:goyo_enter()
  set nocursorline
  hi clear ColorColumn
  hi clear VertSplit
  hi clear EndOfBuffer
endfunction

function! s:goyo_leave()
  set cursorline
  hi clear ColorColumn
  hi ColorColumn ctermbg=234 guibg=#1d2021
  hi VertSplit ctermbg=234 guibg=#1d2021
  hi EndOfBuffer  ctermbg=234 guibg=#1d2021
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" Plugin: VimWiki {{{
let g:vimwiki_auto_header = 1
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_filetypes = ['markdown']
let g:vimwiki_list = [
  \   {
  \     'path': '~/Documents/Notes/',
  \     'path_html': '~/Public/Wiki/',
  \     'custom_wiki2html': '~/bin/wiki2html',
  \     'syntax': 'markdown',
  \     'ext': '.md',
  \     'auto_diary_index': 1,
  \     'auto_tags': 1
  \   }
  \ ]
" }}}
