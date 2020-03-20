
if exists("g:trepl_loaded")
  finish
endif

let g:trepl_loaded = 1
let g:trepl_active = 0

function! s:send_to_tmux(text)
	let text = getline('.')
	let text = substitute(text, "$", "\r", 'g')

	let target = system("tmux list-panes | grep -v active | cut -d ':' -f 1 | head -1")
	call system("tmux set-buffer '" . text . "'" )
	call system("tmux paste-buffer -t " . target)
endfunction

function! s:get_visual_selection()
	let line_start = getpos("'<")[1]
	let line_end = getpos("'>")[1]
	let lines = getline(line_start, line_end)

	if len(lines) == 0
	    return ''
	endif

	return join(lines, "\n")
endfunction

function! SendLineToTmux()
	let line = getline('.')
	call s:send_to_tmux(line)
	normal j
endfunction

function! SendLinesToTmux()
	let lines = s:get_visual_selection()
	call s:send_to_tmux(lines)
	normal j
endfunction

function! TReplToggleMappings()
    if g:trepl_active
	nnoremap <silent> <space>  :call SendLineToTmux()<CR>
	vnoremap <silent> <space>  :call SendLinesToTmux()<CR>
    else
        nunmap <space>
        vunmap <space>
    endif

    let g:trepl_active = !g:trepl_active
endfunction

nnoremap <silent> <leader>t 	  :call TReplToggleMappings()<CR>


