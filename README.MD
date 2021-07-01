Install homebrew
-

Install git & curl
-

Brew install Node/NPM, Yarn
- npm install --global yarn

Install Neovim extension for NPM/Yarn
- yarn global add neovim

Connect to Github
Generate new or copy existing SSH key and link it to Github account.

Install Shezmoi
- with Curl (sh -c "$(curl -fsLS git.io/chezmoi)")
- with Homebrew (brew install chezmoi)

Initialize Shezmoi dotfiles
- chezmoi init https://github.com/roanmertens/chezmoi_dotfiles.git

Install NeoVim
1. Install Plug.Vim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
2. In Neovim run `PlugInstall`
