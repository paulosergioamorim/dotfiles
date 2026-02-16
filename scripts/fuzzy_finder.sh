#!/usr/bin/bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/programs ~/programs/ctjunior -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

tmux new-session -As $selected_name -c $selected

