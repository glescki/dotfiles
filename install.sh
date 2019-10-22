#!/bin/bash

## GIT
# Make global git settings
git config --global core.editor "vim"
git config --global user.email "glecki@gmail.com"
git config --global user.name "Gabriel Olescki"

## ZSH

# Install zsh
apt-get install zsh

# Make it the default shell

chsh -s /usr/bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

## VIM

# Copy ./vim/.vimrc to ~/.vimrc
# First create a backup ~/.vimrc called .vimrc.old
cp ~/.vimrc ~/.vimrc.old

# Then overwrites ~/.vimrc with local .vimrc file
cp ./vim/.vimrc ~

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install all plugins in .vimrc file
vim +PluginInstall +qall

# Install YouCompleteMe
# python3 ~/.vim/bundle/youcompleteme/install.py --clang-completer

# Update all plugins (kinda redundant)
vim +PluginUpdate +qall

## TMUX

# Install tmux plugin manager 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy ./tmux/.tmux.conf to ~/.tmux.conf
# First create a backup ~/.tmuxrc called .tmux.conf.old
cp ~/.tmux ~/.tmux.conf.old

# Then overwrites ~/.tmuxrc with local .tmux.conf file
cp ./tmux/.tmux.conf ~
