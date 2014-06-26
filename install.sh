#!/usr/bin/env bash
DIR_OF_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e

cd $DIR_OF_SCRIPT

git submodule update --init
#parallel -j4 cd {}\; pwd\; git pull :::: <(git submodule status | awk '{print $2}')
git submodule status | awk '{print $2}' | parallel -j8 'cd {}; pwd; git pull'

cd $HOME

ln -sf $DIR_OF_SCRIPT/tmux.conf $HOME/.tmux.conf
ln -sf $DIR_OF_SCRIPT/oh-my-zsh/zshrc $HOME/.zshrc
ln -sf $DIR_OF_SCRIPT/vim-dot-files $HOME/.vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
ln -sf $DIR_OF_SCRIPT/bin $HOME/bin
ln -sf $DIR_OF_SCRIPT/ackrc $HOME/.ackrc
ln -sf $DIR_OF_SCRIPT/gitconfig $HOME/.gitconfig
ln -sf $DIR_OF_SCRIPT/emacs/emacs-live $HOME/.emacs.d
ln -sf $DIR_OF_SCRIPT/emacs/.live-packs $HOME/.live-packs
ln -sf $DIR_OF_SCRIPT/emacs/evilmode-pack $HOME/.evilmode-pack
