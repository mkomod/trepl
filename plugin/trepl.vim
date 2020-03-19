" based on replit.vim

if exists("g:trepl_loaded")
  finish
endif

let g:trepl_loaded = 1

function! Send_to_Tmux_Pane()
	let text = getline('.')

	if text !~ '[^\s]'
	    let text="\r"
	endif

	let target = system("tmux list-panes | grep -v active | cut -d ':' -f 1 | head -1")
	let text = substitute(text, "'", "'\\\\''", 'g')
	let text = system("echo '".text."' | sed '/^[ \\t]*$/ d;:a;s/\\([\\t]\*\\)[\t]/\\1 /;ta'")
	let text = substitute(text, "'", "'\\\\''", 'g')
	call system("tmux set-buffer '" . text . "'" )
	call system("tmux paste-buffer -t " . target)
endfunction

nmap <silent> <space> :call Send_to_Tmux_Pane()<CR>j
" nmap <silent> <space> V$<space>j
" nmap <silent> <leader><space> ggVG<space>



