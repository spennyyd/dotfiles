#!/bin/bash

SESSION_NAME=$1
PROJECT_PATH=$2

if [ -z $SESSION_NAME ]; then 
  echo "Session name must be provided"
  exit 1
fi

if [ -z $PROJECT_PATH]; then 
  echo "Session name must be provided"
  exit 1
fi


tmux new-session -d -s $SESSION_NAME -c $PROJECT_PATH
tmux rename-window -t $SESSION_NAME:1 'neovim'
tmux send-keys -t $SESSION_NAME:1 'nvim .' Enter
tmux new-window -t $SESSION_NAME -n 'git'
tmux attach -t $SESSION_NAME
