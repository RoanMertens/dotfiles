" ------- Dirvish -------
nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

augroup dirvish_config
  autocmd!
  " Map `t` to open in new tab.
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
augroup END

set splitbelow
set splitright

" ------- CtrlP / Ripgrep -------
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/](\.git|bower_components|log|node_modules|tmp|vendor)$'
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <leader>p :CtrlPBuffer<CR>
if executable('Rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'Rg %s --files --color=never --glob ""'
  let g:ctrlp_switch_buffer = 'et'
  let g:ctrlp_use_caching = 0
endif
