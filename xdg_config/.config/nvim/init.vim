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
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'roman/golden-ratio'
Plug 'vimwiki/vimwiki'
Plug 'Shougo/context_filetype.vim'

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
set fillchars=diff:⣿,vert:│
set fillchars+=eob:\                    " suppress ~ at EndOfBuffer
set conceallevel=2 concealcursor=n      " Don't show hidden characters"
set complete+=kspell
set tags+=./.git/tags
set cursorline

" =[ Mappings ]=================================================================
let mapleader = ","
let maplocalleader = "\\"

" Leader mappings {{{
nmap <leader><leader> :!

" Shorcut for quick substitution
nnoremap <leader>s :%s//gg<left><left><left>

" Remove selected hightlight
noremap <leader><space> :nohlsearch<cr>:call clearmatches()<cr>:echo 'Search cleared'<CR>

" Easier linewise reselection
nnoremap <leader>v V`]

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

" Go by visual lines (happens when lines are wrapped)
nmap k gk
nmap j gj

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Quickly diffing to panes
nnoremap <leader>dt :windo diffthis<CR>
nnoremap <leader>du :windo diffupdate<CR>
nnoremap <leader>do :windo diffoff<CR>

" Change case
inoremap <C-u> <esc>gUiwea

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>


" =[ Prettier ]=================================================================
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" =[ Fugitive ]=================================================================
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

" Comment out lines with Commentary
map <leader>/ gcc

" =[ FZF ]======================================================================
map <C-p> :FZF<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
map <leader>b :Buffers <CR>
map <leader>c :Commands <CR>
map <leader>ta :Tags <CR>
map <leader>h :Helptags <CR>

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Quickly search
autocmd QuickFixCmdPost *grep* cwindow
map <leader>A :grep! "FIXME\|TODO"<CR>
nmap <leader>F :grep! <C-r><C-w><CR>

" =[ Turbux ]===================================================================
" Turbo Ruby testing with tmux
let g:turbux_runner = 'vimux'
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
let g:neosnippet#snippets_directory = fnamemodify(expand("$MYVIMRC"), ":p:h") . "/snippets/"
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

" = [ vim-go ] =================================================================
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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

" = [Useful snippets] ==========================================================
iabbrev bpry require 'pry'; binding.pry;
