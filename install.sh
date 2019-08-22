#!/bin/bash

## ZSH 

# Install zsh
# apt-get install zsh

# Make it the default shell

# chsh -s /usr/bin/zsh 

# Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


## VIM

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install all plugins in .vimrc file
vim +PluginInstall +qall

# Install YouCompleteMe
python3 ~/.vim/bundle/youcompleteme/install.py --clang-completer

# Update all plugins (kinda redundent)
vim +PluginUpdate +qall
