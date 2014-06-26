#!/usr/bin/env bash
DIR_OF_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e

cd $DIR_OF_SCRIPT

git submodule foreach git pull

cd $HOME

ln -sf $DIR_OF_SCRIPT/tmux.conf ./.tmux.conf
ln -sf $DIR_OF_SCRIPT/oh-my-zsh/zshrc ./.zshrc
ln -sf $DIR_OF_SCRIPT/vim-dot-files ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc
