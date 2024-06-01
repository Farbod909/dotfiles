#!/bin/zsh

cp -f .zshrc ~
cp oh-my-zsh-themes/farbod.zsh-theme ~/.oh-my-zsh/custom/themes
mkdir -p ~/.config/{alacritty,amethyst,borders}  
cp -rf .config/alacritty/* ~/.config/alacritty
cp -rf .config/amethyst/* ~/.config/amethyst
cp -rf .config/borders/* ~/.config/borders