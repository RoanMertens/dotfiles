Install homebrew
- /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Connect to Github
Generate new or copy existing SSH key and link it to Github account.

Install git & curl
-

Install Rbenv
- brew install rbenv
- rbenv init
- rbenv install 2.7.3

Install Node/NPM, Yarn
- brew install npm
- npm install --global yarn

Install Neovim extension for NPM/Yarn
- yarn global add neovim

Remove existing Node versions
- brew uninstall --ignore-dependencies node 
- brew uninstall --force node

Install NVM on MacOs
- brew install nvm
- mkdir ~/.nvm

Install Shezmoi
- with Curl (sh -c "$(curl -fsLS git.io/chezmoi)")
- with Homebrew (brew install chezmoi)

Initialize Shezmoi dotfiles
- chezmoi init https://github.com/roanmertens/dotfiles.git

Install latest or specific Node Version.
- nvm install node
  nvm install 12.16.1

Add zsh-autosuggestions and zsh-syntax-highlighting
- git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
- git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

Install NeoVim packages
1. Install Plug.Vim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
2. In Neovim run `PlugInstall`

Install bundler
- gem install bundler

Add personal acess tokens to bundler config file (can this be done with Chezmoi?)
- bundle config https://rubygems.pkg.github.com/smartpension username:personal_access_token_with_read_access
