" TODO
" - only load once thing
" - call an autoload function and provide an option to not create bindings

let g:open_vim_patterns = [
      \ ["^/.*", "norm! gf"],
      \ ["QA-[0-9][0-9]*", "!firefox 'https://jira.yojoe.local/browse/<VALUE>'"],
      \ ["PDS-[0-9][0-9]*", "!firefox 'https://support-jira.yojoe.local/browse/<VALUE>'"],
      \ ["^http://.*", "!firefox '<VALUE>'"]
      \ ]

function! s:matchingHandler(word)
  for pattern in g:open_vim_patterns
    if match(a:word, pattern[0]) != -1
      let match = matchlist(a:word, pattern[0])[0]
      return substitute(pattern[1], "<VALUE>", match, 'gc')
    endif
  endfor
  return "norm! gf"
endfunction

function! s:handle(word)
  let command = s:matchingHandler(a:word)
  execute command
endfunction

nnoremap gf :call <SID>handle(expand("<cWORD>"))<CR>
