#!/usr/bin/env bash
DIR_OF_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ~

ln -sf $DIR_OF_SCRIPT/tmux.conf ./.tmux.conf
