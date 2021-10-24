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
let g:python3_host_prog = '/usr/bin/python3'

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'f3fora/cmp-spell'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'kevinhwang91/nvim-bqf'

Plug 'roman/golden-ratio', { 'on': ['GoldenRatioResize', 'GoldenRatioToggle'] }
Plug 'folke/zen-mode.nvim'
Plug 'Shougo/context_filetype.vim'
Plug 'junegunn/gv.vim' " Simple git log viewer - <leader>gl
Plug 'fabi1cazenave/termopen.vim'
Plug 'kassio/neoterm'
Plug 'godlygeek/tabular'

Plug 'fatih/vim-go',            { 'for': 'go' }
Plug 'jgdavey/vim-blockle',     { 'for': 'ruby' }
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

Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-smartinput'

" Setup telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'

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
set completeopt=menu,menuone,noselect
set cursorline
set foldenable
set foldlevel=999999
set foldlevelstart=10
set foldtext=folding#text()
set pumheight=10
set clipboard+=unnamedplus
let mapleader = "\ "
let maplocalleader = "\\"
" }}}

" Look & feel {{{
augroup SwitchBackgroundColors
  autocmd!
  autocmd ColorSchemePre papercolor set background=light
  autocmd ColorSchemePre gruvbox    set background=dark
  autocmd ColorScheme    *          call s:lightline_update()
                                \ | hi Normal guibg=NONE ctermbg=NONE
                                \ | hi EndOfBuffer guibg=NONE ctermbg=NONE

  autocmd FocusLost,WinLeave *      let &l:colorcolumn = ''
  autocmd BufEnter,FocusGained,VimEnter,WinEnter *
                                \   let &l:colorcolumn = '+1'
  autocmd FocusGained *             call s:lightline_update()

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

" Mappings: General {{{
" Open project todoes/notes in tab
nmap <localleader>d :tab drop tmp/gergo-todo.md<CR>
" Keep the previous clipboard value
vnoremap p "_dP
" Paste without overwriting default register (doesn't work with other registers)
xnoremap p pgvy
" Select the previously pasted text
nnoremap gp `[v`]
" Alt + Backspace should delete the last word
inoremap <A-BS> <C-W>
" Yank from cursor till the end of the line - Behave like all the other capital letters
nnoremap Y y$

" Don't move on *
nnoremap * *Nzzzv
" Don't move on J
nnoremap J mzJ`z

" Keep search matches in the middle of the window and pulse the line when moving to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Have relative jumps in the jump list (bigger than 5)
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'gj'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'gk'

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ; ;<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u

" Remove selected highlight
noremap <leader><leader> :nohlsearch<cr>:call clearmatches()<cr>:echo 'Search cleared'<CR>

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

" Move lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Shorcut for quick substitution
nnoremap <leader>s :%s//gc<left><left><left>
vnoremap <leader>s :%s/<c-r>//gc<left><left><left>

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

" Upcase last word
inoremap <C-u> <esc>gUiwea

nnoremap [oc :set conceallevel=2 <CR>
nnoremap ]oc :set conceallevel=0 <CR>
" }}}

" Mappings: Folding {{{
" Use ,z to "focus" the current fold.
nnoremap zf zMzvzz
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
cabbrev g Git
" Open file for diff in new tab and jump to the first change
nnoremap <leader>gd <C-w>s<C-w>T:Gdiff<cr>zRgg]c
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gco :GBranches<cr>
nnoremap <leader>gci :Git commit<cr>
noremap <silent> <leader>gl :GV<CR>
noremap <silent> <leader>dg :diffget<CR>
noremap <silent> <leader>dp :diffput<CR>
" }}}

" Plugin: Telescope {{{
cabbrev t Telescope
nnoremap <leader>fa <cmd>Telescope lsp_code_action<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_status<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope keymaps<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>
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

" Plugin: VimWiki {{{
let g:vimwiki_auto_header = 1
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_filetypes = ['markdown']
  " \     'custom_wiki2html': '~/bin/wiki2html',
let g:vimwiki_list = [
  \   {
  \     'path': '~/Documents/Notes/',
  \     'path_html': '~/Public/Wiki/',
  \     'custom_wiki2html': $HOME.'/.config/nvim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh',
  \     'syntax': 'markdown',
  \     'ext': '.md',
  \     'auto_diary_index': 1,
  \     'auto_tags': 1,
  \     'auto_toc': 1,
  \     'links_space_char': '-'
  \   }
  \ ]
" }}}
