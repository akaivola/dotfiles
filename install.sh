#!/usr/bin/env bash
DIR_OF_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e

cd $DIR_OF_SCRIPT

git submodule init --update
git submodule foreach git pull

cd $HOME

ln -sf $DIR_OF_SCRIPT/tmux.conf $HOME/.tmux.conf
ln -sf $DIR_OF_SCRIPT/oh-my-zsh/zshrc $HOME/.zshrc
ln -sf $DIR_OF_SCRIPT/vim-dot-files $HOME/.vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
ln -sf $DIR_OF_SCRIPT/bin $HOME/bin
ln -sf $DIR_OF_SCRIPT/ackrc $HOME/.ackrc
ln -sf $DIR_OF_SCRIPT/gitconfig $HOME/.gitconfig
ln -sf $DIR_OF_SCRIPT/emacs-live $HOME/.emacs.d
