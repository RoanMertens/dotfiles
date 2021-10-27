" This is the vim initialzer file from R.Mertens.
" It is my first time creating it from scratch. Please take it easy on me ;)

call plug#begin('~/.config/plugged')
" THEME
Plug 'joshdick/onedark.vim' " theme
Plug 'itchyny/lightline.vim' " status/tab line configuration

" NAVIGATION
Plug 'ctrlpvim/ctrlp.vim' " control p fuzzy finder
Plug 'jremmen/vim-ripgrep' " speeds up ctrlp?  dirvish path navigator & git integration
Plug 'justinmk/vim-dirvish' " directory viewer

"QUALITY OF LIFE
Plug 'scrooloose/nerdcommenter' " toggle comment
Plug 'AndrewRadev/splitjoin.vim' " toggle between one liners and multi line
Plug 'junegunn/vim-peekaboo' " shows register when in use

" VERSION CONTROL
Plug 'kristijanhusak/vim-dirvish-git' " adds git functionality to dirvish directory viewer plugin
Plug 'tpope/vim-fugitive' " adds Git commands
Plug 'mhinz/vim-signify' " adds Git indications of changed lines

" RUBY/RAILS
Plug 'tpope/vim-rails'

" GOLANG
Plug 'fatih/vim-go'

" LSP
Plug 'neovim/nvim-lspconfig' " Adds lsp configuration
call plug#end()

" ------- remapped leader key -------
let mapleader = " " " map <SPACE> <leader>

source ~/.config/nvim/startup/theme.vim
source ~/.config/nvim/startup/settings.vim
source ~/.config/nvim/startup/navigation.vim
source ~/.config/nvim/startup/quality_of_life.vim
source ~/.config/nvim/startup/languages.vim
source ~/.config/nvim/startup/lsp.vim

" '✘' // error sign
" '⚠' // warning sign
