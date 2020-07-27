#!/bin/bash

## GIT
# Make global git settings
cp git/* ~

## FISH

# Install fish
sudo pacman -S fish

# Make it the default shell
chsh -s /usr/bin/fish

# Install oh-my-fish
curl -L https://get.oh-my.fish | fish

# Fish fzf functions
omf install https://github.com/jethrokuan/fzf

cp ./fish/config.fish ~/.config/fish/

## VIM

# Copy ./vim/.vimrc to ~/.vimrc
# First create a backup ~/.vimrc called .vimrc.old
if [[ -f ~/.vimrc ]];
then
    cp ~/.vimrc ~/.vimrc.old
fi

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
if [[ -f ~/.tmux.conf ]];
then
    cp ~/.tmux.conf ~/.tmux.conf.old
fi

# Then overwrites ~/.tmuxrc with local .tmux.conf file
cp ./tmux/.tmux.conf ~

## Alacritty
cp ./alacritty/alacritty.yml ~/.config/alacritty/

## Starship
curl -fsSL https://starship.rs/install.sh | bash

cp ./starship/starship.toml ~/.config/
