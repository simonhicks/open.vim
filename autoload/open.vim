if exists("g:did_autoload_open")
  finish
endif
let g:did_autoload_open = 1

function! s:matchingHandler(word)
  for pattern in g:open_vim_patterns
    if match(a:word, pattern[0]) != -1
      let match = matchlist(a:word, pattern[0])[0]
      return substitute(pattern[1], "<VALUE>", escape(match, '#%'), 'gc')
    endif
  endfor
  return "norm! gf"
endfunction

function! open#handle(word)
  let command = s:matchingHandler(a:word)
  execute command
endfunction
