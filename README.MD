Connect to Github
Generate new or copy existing SSH key and link it to Github account.

Install Shezmoi
- with Curl (sh -c "$(curl -fsLS git.io/chezmoi)")
- with Homebrew (brew install chezmoi)

Initialize Shezmoi dotfiles


Install NeoVim
1. Install Plug.Vim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
2. In Neovim run `PlugInstall`
