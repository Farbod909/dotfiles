#!/bin/zsh

cp -f .zshrc ~

cp oh-my-zsh-themes/farbod.zsh-theme ~/.oh-my-zsh/custom/themes

mkdir -p ~/.config  
cp -rf .config/* ~/.config