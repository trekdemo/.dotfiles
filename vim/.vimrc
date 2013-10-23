" .vimrc
" Author: Gergo Sulymosi <gergo.sulymosi@gmail.com>
" Source: http://github.com/trekdemo/.dotfiles
"
" Preamble ---------------------------------------------------------------- {{{

set nocompatible                        " I'm using vim not vi
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'danro/rename.vim'
Bundle 'edsono/vim-matchit'
Bundle 'justinmk/vim-gtfo'
Bundle 'kana/vim-smartinput'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/vitality.vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'w0ng/vim-hybrid'
Bundle 'jgdavey/vim-turbux'
Bundle 'benmills/vimux'

" Performance killers
" Bundle 'scrooloose/syntastic'
" Bundle 'majutsushi/tagbar'

" Bundle 'garbas/vim-snipmate' " Need to learn the difference

filetype plugin indent on

" }}}
" Basic options ----------------------------------------------------------- {{{
let g:ruby_path = system('echo $HOME/.rbenv/shims')
set encoding=utf-8
set shell=/bin/zsh
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
set ruler                               " Show line and column number
set showbreak=↪
set list                                " Show invisible characters
set listchars=tab:·\ ,trail:·,eol:¬,extends:❯,precedes:❮
" iTerm2 is currently slow as ball at rendering the nice unicode lines, so for
" now I'll just use ascii pipes.  They're ugly but at least I won't want to kill
" myself when trying to move around a file.
set fillchars=diff:⣿,vert:│
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
set tags=./.tags,.tags
set wildmenu                              "show list for autocomplete
set wildmode=list:longest                 "priority for tab completion
set wildignore+=*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store
  " Backups {{{

  " Make Vim able to edit crontab files again.
  set backupskip=/tmp/*,/private/tmp/*"
  set undodir=~/.vim/tmp/undo//           " undo files
  set backupdir=~/.vim/tmp/backup//       " backups
  set directory=~/.vim/tmp/swap//         " swap files
  set backup                              " enable backups
  set noswapfile                          " It's 2012, Vim.

  " }}}
  " Spelling {{{
    try
      lang en_us
    catch
    endtry

    " Spelling highlights. Use underline in term to prevent cursorline highlights
    " from interfering
    if !has("gui_running")
      hi clear SpellBad
      hi SpellBad cterm=underline ctermfg=red
      hi clear SpellCap
      hi SpellCap cterm=underline ctermfg=blue
      hi clear SpellLocal
      hi SpellLocal cterm=underline ctermfg=blue
      hi clear SpellRare
      hi SpellRare cterm=underline ctermfg=blue
    endif
  " }}}
" }}}
" Color scheme ------------------------------------------------------------ {{{

syntax enable                           " Switch syntax highlighting on
set t_Co=256                            " User 256 colors
set synmaxcol=240                       " Hightlight only the first n chars

set background=dark
colorscheme hybrid
let g:airline_theme='badwolf'

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
match ErrorMsg '\s\+$'

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
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>
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
map           <leader>tn :tabnext<cr>
map           <leader>tp :tabprevious<cr>
" Use ,z to "focus" the current fold.
nnoremap      <leader>z zMzvzz
" Regenerate ctags
map           <Leader>ct :!ctags -R -f .tags *<CR>
nmap          <leader>b :TagbarToggle<CR>
map           <leader>rd :call RangerChooser()<CR>
map           <leader>d :Ex %%<CR>
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

" Scroll faster
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Change case
" nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

nnoremap <cr> zvzz

" Move in screen lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Move up/down in insert mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
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
nnoremap * *<c-o>
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_


" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

if has("gui_macvim") && has("gui_running")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <M-]> >gv
  vmap <M-[> <gv

  nmap <M-]> >>
  nmap <M-[> <<

  omap <M-]> >>
  omap <M-[> <<

  imap <M-]> <Esc>>>i
  imap <M-[> <Esc><<i

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  " nmap <C-k> [e
  " nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

endif
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
    au Filetype haml setlocal foldlevelstart=999
    au Filetype haml setlocal foldmethod=indent
augroup END

" }}}
" ActionScript {{{
  augroup ft_actionscript
    au!
    au BufNewFile,BufRead *.as setlocal filetype=actionscript
    au Filetype actionscript setlocal foldmethod=marker
    au Filetype actionscript setlocal foldmarker={,}
    au FileType actionscript setlocal omnifunc=actionscriptcomplete#Complete
    au FileType actionscript setlocal dictionary=$HOME/.vim/dict/actionscript.dict
    au FileType actionscript setlocal autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2
    au FileType actionscript setlocal errorformat=
                                        \%E%f(%l):\ col:\ %c\ Error:\ %m,
                                        \%W%f(%l):\ col:\ %c\ Warning:\ %m,
                                        \%E%f:\ Error:\ %m,
                                        \%W%f:\ Warning:\ %m,
                                        \%-G%.%#
  augroup END
" }}}
" Javascript {{{
  augroup ft_javascript
    au!
    au Filetype javascript setlocal foldmethod=marker foldmarker={,}
  augroup END
" }}}
" Java {{{
  augroup ft_java
    au!
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
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
    au Filetype markdown nnoremap <leader>p :silent !open -a Marked.app '%:p'<cr>
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

  " Qdo {{{
    command! -nargs=0 -bar Qargs execute 'args ' . s:QuickfixFilenames()

    " Contributed by "ib."
    " http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim#comment8286582_5686810
    command! -nargs=1 -complete=command -bang Qdo call s:Qdo(<q-bang>, <q-args>)

    function! s:Qdo(bang, command)
      if exists('w:quickfix_title')
        let in_quickfix_window = 1
        cclose
      else
        let in_quickfix_window = 0
      endif

      arglocal
      exe 'args '.s:QuickfixFilenames()
      exe 'argdo'.a:bang.' '.a:command
      argglobal

      if in_quickfix_window
        copen
      endif
    endfunction

    function! s:QuickfixFilenames()
      " Building a hash ensures we get each buffer only once
      let buffer_numbers = {}
      for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
      endfor
      return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
    endfunction
  " }}}
  " Ranger {{{
    fun! RangerChooser()
        exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
        if filereadable('/tmp/chosenfile')
            exec 'edit ' . system('cat /tmp/chosenfile')
            call system('rm /tmp/chosenfile')
        endif
        redraw!
    endfun
  " }}}


" }}}
" Plugin settings --------------------------------------------------------- {{{
  " Airline {{{
    let g:airline_powerline_fonts=0
  " }}}
  " Tagbar {{{

    let g:tagbar_type_coffee = {
          \ 'ctagsbin' : 'ctags',
          \ 'ctagsargs' : '',
          \ 'kinds' : [
          \ 'f:functions',
          \ 'v:variable',
          \ ],
          \ 'sro' : ".",
          \ 'kind2scope' : {
          \ 'f' : 'object',
          \ 'v' : 'object',
          \ }
        \ }
    let g:tagbar_type_ruby = {
        \ 'kinds' : [
          \ 'm:modules',
          \ 'c:classes',
          \ 'd:describes',
          \ 'C:contexts',
          \ 'f:methods',
          \ 'F:singleton methods'
        \ ]
      \ }
    let g:tagbar_type_markdown = {
          \ 'ctagstype' : 'markdown',
          \ 'kinds' : [
              \ 'h:headings'
          \ ],
      \ 'sort' : 0,
      \ }

  " }}}
  " Ctrl-P {{{
    let g:ctrlp_root_markers = ['.ruby-version', '.git']
    let g:ctrlp_working_path_mode = 2
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
      " let g:ctrlp_user_command = 'mdfind kind:file -onlyin . %s'
    else
      let g:ctrlp_user_command =
        \ ['.git', 'cd %s && git ls-files . -co --exclude-standard']
    endif
  " }}}
  " Easymotion {{{

    let g:EasyMotion_do_mapping = 0

    nnoremap <silent> <Leader>f      :call EasyMotion#F(0, 0)<CR>
    onoremap <silent> <Leader>f      :call EasyMotion#F(0, 0)<CR>
    vnoremap <silent> <Leader>f :<C-U>call EasyMotion#F(1, 0)<CR>

    nnoremap <silent> <Leader>F      :call EasyMotion#F(0, 1)<CR>
    onoremap <silent> <Leader>F      :call EasyMotion#F(0, 1)<CR>
    vnoremap <silent> <Leader>F :<C-U>call EasyMotion#F(1, 1)<CR>

    " onoremap <silent> <Leader>t      :call EasyMotion#T(0, 0)<CR>
    " onoremap <silent> <Leader>T      :call EasyMotion#T(0, 1)<CR>

  " }}}
  " Fugitive {{{

    cabbrev git Git
    nnoremap <leader>gd :Gdiff<cr>
    nnoremap <leader>gp :Git push<cr>
    nnoremap <leader>gs :Gstatus<cr>
    nnoremap <leader>gw :Gwrite<cr>
    nnoremap <leader>ga :Gadd<cr>
    nnoremap <leader>ge :Gedit<cr>
    nnoremap <leader>gb :Gblame<cr>
    nnoremap <leader>gco :Gcheckout<cr>
    nnoremap <leader>gci :Gcommit<cr>
    nnoremap <leader>gm :Gmove<cr>
    nnoremap <leader>gr :Gremove<cr>
    nnoremap <leader>gl :Shell git lg -25<cr>:wincmd \|<cr>
    nnoremap <leader>gx :Git dx<cr>
    nnoremap <silent> <leader>gt :Git dt<cr>

    augroup ft_fugitive
        au!
        au BufNewFile,BufRead .git/index setlocal nolist spell
    augroup END

" }}}
  " NERDCommenter mappings {{{
  let NERDSpaceDelims = 1
  if has("gui_macvim") && has("gui_running")
    map <D-/> <plug>NERDCommenterToggle<CR>
    imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
  else
    map <leader>/ <plug>NERDCommenterToggle<CR>
    imap <leader>/ <Esc><plug>NERDCommenterToggle<CR>i
  endif
  " }}}
  " The Silver Searcher {{{
    map <D-F> :Ag!<space>
    map <leader>F :Ag!<space>
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
" }}}
" Environments (GUI/Console) ---------------------------------------------- {{{

if has('gui_running') " {{{
  set guifont=Inconsolata-dz\ for\ Powerline:h12

  " Remove all the UI cruft
  set go-=T
  set go-=l
  set go-=L
  set go-=r
  set go-=R

  highlight SpellBad term=underline gui=undercurl guisp=Orange


  " Different cursors for different modes.
  set guicursor=n-c:block-Cursor-blinkon0
  set guicursor+=v:block-vCursor-blinkon0
  "set guicursor+=i-ci:ver20-iCursor

  if has("gui_macvim") "{{{
    " Full screen means FULL screen
    set fuoptions=maxvert,maxhorz

    " Use the normal HIG movements, except for M-Up/Down
    let macvim_skip_cmd_opt_movement = 1
    no   <D-Left>       <Home>
    no!  <D-Left>       <Home>
    no   <M-Left>       <C-Left>
    no!  <M-Left>       <C-Left>

    no   <D-Right>      <End>
    no!  <D-Right>      <End>
    no   <M-Right>      <C-Right>
    no!  <M-Right>      <C-Right>

    no   <D-Up>         <C-Home>
    ino  <D-Up>         <C-Home>
    imap <M-Up>         <C-o>{

    no   <D-Down>       <C-End>
    ino  <D-Down>       <C-End>
    imap <M-Down>       <C-o>}

    imap <M-BS>         <C-w>
    inoremap <D-BS>     <esc>my0c`y
  else
    " Non-MacVim GUI, like Gvim
  end " }}}
else
  " Console Vim
  set mouse=a
endif " }}}

" }}}

