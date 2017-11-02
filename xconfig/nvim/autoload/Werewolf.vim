" WEREWOLF
" Source: https://raw.githubusercontent.com/jonstoler/werewolf.vim/master/plugin/Werewolf.vim

let g:werewolf_day_start = get(g:, 'werewolf_day_start', 8)
let g:werewolf_day_end = get(g:, 'werewolf_day_end', 18)
let g:werewolf_change_automatically = get(g:, 'werewolf_change_automatically', 1)

let s:werewolf_autocmd_allowed = 0

function! Werewolf()
	if strftime("%H") >= g:werewolf_day_start && strftime("%H") < g:werewolf_day_end
		set background=light
	else
		set background=dark
	endif
endfunction

command! -bang WerewolfAuto let g:werewolf_change_automatically = <bang>g:werewolf_change_automatically
command! WerewolfOn let g:werewolf_change_automatically = 0
command! WerewolfOff let g:werewolf_change_automatically = 1

augroup werewolf
	autocmd!
	autocmd WinEnter,WinLeave,FocusLost,FocusGained * call Werewolf()
augroup END
