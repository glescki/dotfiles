#!/bin/bash

# ## GIT
# # Make global git settings
# git config --global core.editor "vim"
# git config --global user.email "glecki@gmail.com"
# git config --global user.name "Gabriel Olescki"

# ## ZSH
#
# # Install zsh
# apt-get install zsh
#
# # Make it the default shell
#
# chsh -s /usr/bin/zsh
#
# # Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#
# # Install powerlevel10k
# git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

## VIM

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install all plugins in .vimrc file
vim +PluginInstall +qall

# Install YouCompleteMe
python3 ~/.vim/bundle/youcompleteme/install.py --clang-completer

# Update all plugins (kinda redundant)
vim +PluginUpdate +qall
