" ------- Quality of life settings -------
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" lightline statusline plugin
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
let g:lightline = {
      \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
        \ },
        \ 'component_function': {
          \   'gitbranch': 'fugitive#head'
          \ },
          \ }

set noshowmode " remove standard mode message (because we use lightline now)

"change the gui hex value to change the background color
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#142222", "cterm": "145", "cterm16" : "7"}
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

colorscheme onedark " !IPORTANT! Load the color scheme as the last line when it comes to style
