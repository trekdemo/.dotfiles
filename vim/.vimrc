" .vimrc
" Author: Gergo Sulymosi <gergo.sulymosi@gmail.com>
" Source: http://github.com/trekdemo/.dotfiles
"
" Preamble ---------------------------------------------------------------- {{{

set nocompatible                        " I'm using vim not vi
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on

" }}}
" Basic options ----------------------------------------------------------- {{{
set encoding=utf-8
set shell=/bin/bash
set nowrap                              " Do not wrap long lines
set number                              " Show linenumbers
set showcmd                             " Show info in the right bottom
set ttyfast
set textwidth=80
set colorcolumn=+1                      " Display margin at 81
set nocursorline                        " Do not hightlight the current line
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
set formatoptions=qcrn1
set clipboard+=unnamed                  " Yanks go on clipboard instead.
set pastetoggle=<F8>
set novisualbell                        " No blinking .
set noerrorbells                        " No noise.
set lazyredraw
set autoread                            " Reload file if it's modified outside
set autowrite
set autoindent
set ruler                               " Show line and column number
set showbreak=↪
set list                                " Show invisible characters
" set listchars=tab:·\ ,trail:·,eol:¬,extends:❯,precedes:❮
set listchars=tab:·\ ,trail:·,extends:❯,precedes:❮
" iTerm2 is currently slow as ball at rendering the nice unicode lines, so for
" now I'll just use ascii pipes.  They're ugly but at least I won't want to kill
" myself when trying to move around a file.
set fillchars=diff:⣿,vert:\|
set nohidden                            " Modified buffers can't be hidden
set splitright                          " New split window on the right
set splitbelow                          " New split window on the bottom
set virtualedit+=block
set complete=.,w,b,u,t                  " Better Completion
set completeopt=longest,menuone,preview
set diffopt+=iwhite                     " Ignore whitespace on diffs
set backspace=indent,eol,start          " Make backspace behave in a sane manner.
set foldenable                          " Use folds"
set foldmethod=syntax
set foldlevel=999999
set foldlevelstart=2
set title
set shiftround
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2
set notimeout
set ttimeout
set timeoutlen=50
" set tags+=./.tags,.tags
set wildmenu                              "show list for autocomplete
set wildmode=full                 "priority for tab completion
set wildignore+=*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store
set mouse=a
let g:ruby_path = system('echo $HOME/.rbenv/shims')
  " Backups {{{

  " Make Vim able to edit crontab files again.
  set backupskip=/tmp/*,/private/tmp/*"
  set undodir=~/.vim/tmp/undo//           " undo files
  set backupdir=~/.vim/tmp/backup//       " backups
  set directory=~/.vim/tmp/swap//         " swap files
  set backup                              " enable backups
  set noswapfile                          " It's 2012, Vim.

  " }}}
" }}}
" Bundles ----------------------------------------------------------------- {{{
Plugin 'gmarik/vundle'

Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'itchyny/lightline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dag/vim-fish'
Plugin 'danro/rename.vim'
Plugin 'edsono/vim-matchit'
Plugin 'endel/vim-github-colorscheme'
Plugin 'godlygeek/tabular'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'jasoncodes/ctrlp-modified.vim'
Plugin 'jgdavey/vim-blockle'
Plugin 'jgdavey/vim-turbux'
Plugin 'justinmk/vim-gtfo'
Plugin 'justinmk/vim-sneak'
Plugin 'kana/vim-smartinput'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'sjl/gundo.vim'
Plugin 'sjl/vitality.vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mtth/scratch.vim'
Plugin 'roman/golden-ratio'
Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'kovisoft/paredit'
Plugin 'losingkeys/vim-niji'
" }}}
" Color scheme ------------------------------------------------------------ {{{

syntax enable                           " Switch syntax highlighting on
set t_Co=256                            " User 256 colors
set synmaxcol=240                       " Hightlight only the first n chars

set background=light
colorscheme PaperColor
let g:lightline = { 'colorscheme': 'PaperColor' }


" }}}
" Mappings ---------------------------------------------------------------- {{{
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
" Leader {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}

" Leader mappings {{{
nmap          <leader><leader> :!
nnoremap      <leader>s :%s//gg<left><left><left>
" Toggle wrap settings
nmap          <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>
" Remove selected hightlight
noremap       <leader><space> :noh<cr>:call clearmatches()<cr>
" Easier linewise reselection
nnoremap      <leader>v V`]
" Adjust viewports to the same size
map           <Leader>= <C-w>=

" GUndo
nmap <silent> <leader>u :GundoToggle<CR>
map           <leader>ew :e %%
map           <leader>es :sp %%
map           <leader>ev :vsp %%
map           <leader>et :tabe %%
map           <leader>ef :Ex %%<CR>
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
" }}}

" Unfuck my screen
nmap U :syntax sync fromstart<cr>:redraw!<cr>

" Omnicomplete in insert mode
" Lines
inoremap <c-l> <c-x><c-l>
" File names
inoremap <c-f> <c-x><c-f>
" Tags
inoremap <c-]> <c-x><c-]>
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" Scroll faster
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Change case
" nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" nnoremap <cr> zvzz
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>a

" Move in screen lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Tabularize
vnoremap <leader>t= :Tabularize /=<CR>

" Move up/down in insert mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" Move between windows
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" Window resizing
nnoremap <S-C-left> 5<c-w>>
nnoremap <S-C-right> 5<c-w><
nnoremap <S-C-up> 5<c-w>+
nnoremap <S-C-down> 5<c-w>-
" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *
nnoremap * *N
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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

" }}}
" Folding ----------------------------------------------------------------- {{{
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
" }}}
" OmniComplete ------------------------------------------------------------ {{{
    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
            \if &omnifunc == "" |
            \setlocal omnifunc=syntaxcomplete#Complete |
            \endif
    endif
" }}}
" Various filetype-specific stuff ----------------------------------------- {{{

" Ruby {{{

augroup ft_ruby
    au!
    au Filetype ruby iab hh =>
    au Filetype ruby setlocal foldmethod=syntax
    au FileType ruby,eruby set omnifunc=rubycomplete#Complete
    " au FileType ruby,eruby set omnifunc=syntaxcomplete#Complete
    au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    au FileType ruby,eruby let g:rubycomplete_rails = 1
    au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    au BufRead,BufNewFile {Guardfile} set ft=ruby
    au BufRead,BufNewFile {Vagrantfile} set ft=ruby
    au BufRead,BufNewFile {Capfile} set ft=ruby
    "improve autocomplete menu color
    highlight Pmenu ctermbg=238 gui=bold

augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" QuickFix {{{

augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap
    au Filetype qf nnoremap <silent> <buffer> q :ccl<CR>
    au Filetype qf nnoremap <silent> <buffer> t <C-W><CR><C-W>T
    au Filetype qf nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>
    au Filetype qf nnoremap <silent> <buffer> o <CR>
    au Filetype qf nnoremap <silent> <buffer> go <CR><C-W><C-W>
    au Filetype qf nnoremap <silent> <buffer> gv <C-W><CR><C-W>H<C-W>b<C-W>J
augroup END

" }}}
" CSS, SASS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less
    au BufNewFile,BufRead *.scss setlocal filetype=scss
    au BufNewFile,BufRead *.scss.erb setlocal filetype=scss

    au Filetype less,css,scss setlocal foldmethod=marker
    au Filetype less,css,scss setlocal foldmarker={,}
    au Filetype less,css,scss setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css,scss setlocal iskeyword+=-

    " Use <leader>S to sort properties.
    au BufNewFile,BufRead *.less,*.css,*.scss nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
augroup END

" }}}
" HAML {{{

augroup ft_haml
    au!
    au Filetype haml setlocal foldmethod=indent nofoldenable
augroup END

" }}}
" Javascript {{{
  augroup ft_javascript
    au!
    au Filetype javascript setlocal foldmethod=marker foldmarker={,}
  augroup END
" }}}
" HTML {{{
  augroup ft_html
    au!
    au Filetype html,eruby,erb set ts=2 sts=2 sw=2 et
  augroup END
" }}}
" Markdown {{{
  augroup ft_markdown
    au!
    au Filetype markdown nnoremap <leader>p :silent !open -a Marked\ 2.app '%:p'<cr>
  augroup END
" }}}
" Fish {{{
  augroup ft_fish
    au!
    au BufNewFile,BufRead *.fish setlocal filetype=fish
    au FileType fish             setlocal foldmethod=expr
  augroup END
" }}}
" Coffee {{{
  augroup ft_coffee
    au!
    autocmd BufNewFile,BufRead *.coffee setlocal filetype=coffee
    autocmd BufNewFile,BufRead *.coffee setlocal foldmethod=indent nofoldenable
  augroup END
" }}}
" Vagrant {{{
  augroup ft_vagrant
    au!
    au BufNewFile,BufRead Vagrantfile setlocal filetype=ruby
  augroup END
" }}}

" }}}
" Autocommands ------------------------------------------------------------ {{{
" Strip tailing whitespace

  " Resize splits when the window is resized
  au VimResized * :wincmd =

  " Make sure Vim returns to the same line when you reopen a file.
  " Thanks, Amit {{{
  augroup line_return
      au!
      au BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \     execute 'normal! g`"zvzz' |
          \ endif
  augroup END

  " }}}
  " Striping whitespaces {{{
    fun! <SID>StripTrailingWhitespaces()
        let l = line(".") " Save last line
        let c = col(".")  " Save last col
        let _s=@/         " Save last search
        %s/\s\+$//e       " Strip whitespaces
        call cursor(l, c) " Restore cursor position
        let @/=_s         " Restore last search
    endfun
    au BufWritePre * :call <SID>StripTrailingWhitespaces()
   " }}}

" }}}
" Searching and movement -------------------------------------------------- {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

" Use Ack instead of Grep when available
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

" }}}
" Plugin settings --------------------------------------------------------- {{{
  " Ctrl-P {{{
    let g:ctrlp_root_markers = ['.ruby-version', '.git']
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_max_height = 20
  " let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
    "                         \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
    let g:ctrlp_extensions = ['tag', 'buffertag']

    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$',
      \ 'link': 'some_bad_symbolic_link',
    \ }
    if executable('ag')
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      let g:ctrlp_use_caching = 0
    else
      let g:ctrlp_user_command =
        \ ['.git', 'cd %s && git ls-files . -co --exclude-standard']
    endif

    " Git modified files
    map <Leader>gm :CtrlPModified<CR>
    map <Leader>gM :CtrlPBranch<CR>
  " }}}
  " Fugitive {{{
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
    " nnoremap <leader>gl !git lg -25<cr>
    nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
    nnoremap <leader>gx :Git dx<cr>
    nnoremap <silent> <leader>gt :Git dt<cr>

    " nnoremap <leader>gp :Git push<cr>
    nnoremap <leader>gps :Dispatch! git push<CR>
    nnoremap <leader>gpl :Dispatch! git pull<CR>

    augroup ft_fugitive
        au!
        au BufNewFile,BufRead .git/index setlocal nolist spell
    augroup END

" }}}
  " commentary.vim {{{
    map <leader>/ gcc
    imap <leader>/ gc
  " }}}
  " The Silver Searcher {{{
    map <leader>F :Ag!<space>
    map <leader>A :Ag "FIXME\|TODO"<CR>
  " }}}
  " Rails {{{
    cabbrev rake Rake
    cabbrev rails Rails
    cabbrev bundle Bundle
    cabbrev rmodel Rmodel
    cabbrev rcontroller Rcontroller
    cabbrev rmigration Rmigration
  " }}}
  " Turbux {{{
    let g:turbux_runner = 'vimux'
    let g:no_turbux_mappings = 1
    let g:turbux_command_prefix = 'clear;'
    map <leader>m <Plug>SendTestToTmux
    map <leader>M <Plug>SendFocusedTestToTmux
  " }}}
  " Vimux {{{
    let g:VimuxUseNearestPane = 1
    map <LocalLeader>vc :VimuxCloseRunner<CR>
    map <LocalLeader>vp :VimuxPromptCommand<CR>
    map <LocalLeader>vr :VimuxRunCommand("")<left><left>
    map <Leader>l :VimuxRunLastCommand<CR>
  " }}}
  " ObjC {{{
    let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
  " }}}
  " Vitality {{{
    " let g:vitality_fix_cursor = 0
    let g:vitality_fix_focus = 0
    let g:vitality_always_assume_iterm = 1
  " }}}
  " Tabular {{{
    if exists(":Tabularize")
      nmap <Leader>a= :Tabularize /=<CR>
      vmap <Leader>a= :Tabularize /=<CR>
      nmap <Leader>a: :Tabularize /:\zs<CR>
      vmap <Leader>a: :Tabularize /:\zs<CR>
      nmap <Leader>a> :Tabularize /=><CR>
      vmap <Leader>a> :Tabularize /=><CR>
    endif
  " }}}
" }}}
