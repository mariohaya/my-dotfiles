#!/bin/sh

file=$1
if [ -d "$file" ]; then
    exa --color=always "$file"
else
    bat --color=always --style=plain "$file"
fi
