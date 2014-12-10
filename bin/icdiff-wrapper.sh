#!/usr/bin/env bash
DIR_OF_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#path old-file old-hex old-mode new-file new-hex new-mode
PATH=$1
OLD_FILE=$2
OLD_HEX=$3
OLD_MODE=$4
NEW_FILE=$5
NEW_HEX=$6
NEW_MODE=$7

echo "$PATH ${OLD_HEX:0:8} .. ${NEW_HEX:0:8}"
PATH=/usr/local/bin /usr/local/bin/icdiff --line-numbers --no-headers $2 $5
