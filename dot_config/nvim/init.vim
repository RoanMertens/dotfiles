" This is the vim initialzer file from R.Mertens.
" It is my first time creating it from scratch. Please take it easy on me ;)



" ------- Plugin installer(Vim Plug) -------

call plug#begin('~/.config/plugged')

" language servers etc
  Plug 'natebosch/vim-lsc'
  Plug 'ajh17/VimCompletesMe'

" adds language specific styling errors
  Plug 'dense-analysis/ale'

" control p fuzzy finder
  Plug 'ctrlpvim/ctrlp.vim'

" statusline/tabline plugin, dependent on the onedark.vim theme
  Plug 'itchyny/lightline.vim'

  "Plug 'Yggdroot/indentLine'
  Plug 'thaerkh/vim-indentguides'

" shortcuts to toggle/add comments
  Plug 'scrooloose/nerdcommenter'

" dirvish path navigator & git integration
  Plug 'justinmk/vim-dirvish'
  Plug 'kristijanhusak/vim-dirvish-git'

 "the current color theme
  Plug 'joshdick/onedark.vim'

" adds a way to togglebetween one liners and multi line if statements
  Plug 'AndrewRadev/splitjoin.vim'

" adds a way to switch list items
  Plug 'AndrewRadev/sideways.vim'

" adds a way to switch list items
  Plug 'AndrewRadev/switch.vim'

" adds sidepanel that shows what is in the register"
  Plug 'junegunn/vim-peekaboo'

" adds git functionality to vim
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'

" vim plugin for editing rails, example: :A for switching to and from spec file
  Plug 'tpope/vim-rails'

" adds the fast fuzzy finder, use with :Rg searchterm
  Plug 'jremmen/vim-ripgrep'

call plug#end()



" ------- Basic settings -------

" enable syntax highlighting
syntax on

" enable mouse
set mouse=a

" Mapping leader to space
map <SPACE> <leader>

" space h to dismiss search result highlighting until next search or press of 'n'
nmap <silent> <leader>h :noh<CR>

" turn off swap files
set noswapfile

" Turn on line numbers with a hybrid of relative and absolute numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Change number of spaces that a <Tab> counts for during editing ops
 "set softtabstop=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Highlight trailing whitespace
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

" Show matching brackets
set showmatch

" ways to copy the filepath
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>


" ways to switch items in an list
nmap gB :SidewaysLeft<CR>
nmap gN :SidewaysRight<CR>

" ways to switch patterns
" nmap gr :SwitchReverse<CR>

" ------- Ruby on Rails settings -------

" treat scss files as css
au BufRead,BufNewFile *.scss set filetype=css

" true colors on
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif



" ------- Vim theme settings -------

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

" remove standard mode message (because we use lightline now)
set noshowmode

"change the gui hex value to change the background color
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#142222", "cterm": "145", "cterm16" : "7"}
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

"Load the color scheme as the last line when it comes to style
colorscheme onedark

" ------- NerdCommenter -------
let NERDSpaceDelims=1

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

" ------- CtrlP -------
"
" optimizing the runspeed
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/](\.git|bower_components|log|node_modules|tmp|vendor)$'
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <leader>t :CtrlP<cr>
map <leader>g :CtrlPModified<cr>
map <leader>p :CtrlPBuffer<CR>
if executable('Rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'Rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif


" ------- Ale -------

" setting the error line icons"
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign guifg=red guibg=none ctermbg=none ctermfg=red
highlight ALEWarningSign guifg=yellow ctermbg=none ctermfg=yellow


" ------- LSC server -------

" https://bluz71.github.io/2019/10/16/lsp-in-vim-with-the-lsc-plugin.html
let g:lsc_server_commands = {
 \  'ruby': {
 \    'command': 'solargraph stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'javascript': {
 \    'command': 'typescript-language-server --stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  }
 \}
let g:lsc_auto_map = {
 \  'GoToDefinition': 'gd',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'FindCodeActions': 'ga',
 \  'Completion': 'omnifunc',
 \}
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'
set completeopt=menu,menuone,noinsert,noselect
" let g:lsc_enable_diagnostics = v:true
