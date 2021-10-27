" ------- Basic settings -------
set title " turns on the terminal tab title
set titlestring=Neovim:\ %-25.30F\ %a%r%m " configures the terminal tab title
set noswapfile " turn off swap files
syntax on " Enable syntax highlighting
set showmatch " Show matching brackets
set number " enable line numbers
set cursorline " highligh the curren line
set viminfo='100,<9999,s100 " store info from no more than 100 files, 9999 lines of text and 100kb of data

" ------- Indentation -------
set tabstop=8     " tabs are at proper location
set softtabstop=0
set shiftwidth=2
set smarttab
set expandtab     " don't use actual tab character (ctrl-v)
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
" set wrap        " automatically wraps text that extends beyond the screen
filetype on " enable file type detection
filetype indent on " enable automatic indentation for different file types
filetype plugin on " enable automatic loading of plugins for file types

" Highlight trailing whitespace
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ " \ze sets end of match so only spaces highlighted

" ------- remapped keys -------
" Space h to dismiss search result highlighting until next search or press of 'n'
nmap <silent> <leader>h :noh<CR>
