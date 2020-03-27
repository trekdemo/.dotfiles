setlocal spell

" Highlight code blocks with different background color
" Source: https://www.reddit.com/r/vim/comments/fob3sg/different_background_color_for_markdown_code
setlocal signcolumn=no
highlight markdownCodeBlockBG ctermbg=15 guibg=#1d2021
sign define codeblock linehl=markdownCodeBlockBG

function! MarkdownBlocks()
    let l:continue = 0
    execute "sign unplace * file=".expand("%")

    " Iterate through each line in the buffer
    for l:lnum in range(1, len(getline(1, "$")))
        " Detect the start fo a code block
        if getline(l:lnum) =~ "^```.*$" || l:continue
            " Continue placing signs, until the block stops
            let l:continue = 1
            " Place sign
            execute "sign place ".l:lnum." line=".l:lnum." name=codeblock file=".expand("%")
            " Stop placing signs
            if getline(l:lnum) =~ "^```$"
                let l:continue = 0
            endif
        endif
    endfor
endfunction

" Use signs to highlight code blocks
" Set signs on loading the file, leaving insert mode, and after writing it
autocmd InsertLeave *.md call MarkdownBlockse()
autocmd BufEnter *.md call MarkdownBlocks()
autocmd BufWritePost *.md call MarkdownBlocks()
