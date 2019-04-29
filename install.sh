#!/usr/bin/env bash

brew list fzf > /dev/null || brew install fzf
brew list lftp > /dev/null || brew install lftp
brew list neovim > /dev/null || brew install neovim
brew list stow > /dev/null || brew install stow
brew list python > /dev/null || brew install python
brew list thefuck > /dev/null || brew instal thefuck
brew cask list hammerspoon > /dev/null || brew cask install hammerspoon


source ./stow.sh

source ~/.profile

pip install pynvim
pip install youtube-dl

mkdir -p ~/.cache/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +UpdateRemotePlugins +qall

if ! [ -f /usr/local/bin/vim ]; then
	ln -s "$(which nvim)" /usr/local/bin/vim
fi

find ${HOME}/.local/bin | xargs chmod +x


