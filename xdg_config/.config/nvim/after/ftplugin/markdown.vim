setlocal spell nonumber wrap linebreak breakindent formatoptions=ln
set breakindent
set breakindentopt=shift:2

let g:markdown_fenced_languages = ['yaml', 'ruby', 'json', 'sh', 'javascript']

nmap <buffer> <silent> - :Ex<cr>
nmap <buffer> <silent> <localleader>g :Goyo<cr>
nmap <buffer> <silent> <localleader>p :!open -a 'Marked 2' '%'<cr>


" Highlight code blocks with different background color
" Source: https://www.reddit.com/r/vim/comments/fob3sg/different_background_color_for_markdown_code
function! MarkdownBlocks()
    let l:continue = 0
    execute "sign unplace * file=".expand("%")

    " Iterate through each line in the buffer
    for l:lnum in range(1, len(getline(1, "$")))
        " Detect the start fo a code block
        if getline(l:lnum) =~ "^\s*```.*$" || l:continue
            " Continue placing signs, until the block stops
            let l:continue = 1
            " Place sign
            execute "sign place ".l:lnum." line=".l:lnum." name=codeblock file=".expand("%")
            " Stop placing signs
            if getline(l:lnum) =~ "^\s*```$"
                let l:continue = 0
            endif
        endif
    endfor
endfunction

if g:colors_name == 'gruvbox'
  highlight markdownCodeBlockBG ctermbg=15 guibg=#1d2021
else
  highlight markdownCodeBlockBG guibg=#d9d9d9
endif

setlocal signcolumn=no
sign define codeblock linehl=markdownCodeBlockBG

autocmd InsertLeave *.md call MarkdownBlocks()
autocmd BufEnter *.md call MarkdownBlocks()
autocmd BufWritePost *.md call MarkdownBlocks()
