
if exists("g:trepl_loaded")
  finish
endif

let g:trepl_loaded = 1
let g:trepl_active = 1 

function! SendToTmux()
	let text = getline('.')
	let text = substitute(text, "$", "\r", 'g')

	let target = system("tmux list-panes | grep -v active | cut -d ':' -f 1 | head -1")
	call system("tmux set-buffer '" . text . "'" )
	call system("tmux paste-buffer -t " . target)

	normal j
endfunction

noremap <silent> <space>  :exe "if g:trepl_active \n call SendToTmux() \n endif"<CR>
nnoremap <leader>t 	  :let g:trepl_active=!g:trepl_active<CR>
" nmap <silent> <leader><space> ggVG<space>

