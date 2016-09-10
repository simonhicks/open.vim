if exists("g:did_plugin_open")
  finish
endif
let g:did_plugin_open = 1

if !exists("g:open_vim_no_bindings") || g:open_vim_no_bindings ==# 0
  nnoremap gf :call open#handle(expand("<cWORD>"))<CR>
endif
