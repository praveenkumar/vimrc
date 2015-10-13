#!/bin/sh

echo "Creating bundle directory"
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

echo "Install youcomleteme dependencies"
sudo dnf install gcc gcc-c++ python-devel cmake

echo "Cloning plugin repo"
git clone https://github.com/VundleVim/Vundle.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/Lokaltog/powerline.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/altercation/solarized.git
git clone https://github.com/jnwhiteh/vim-golang.git
git clone https://github.com/tfnico/vim-gradle.git
git clone https://github.com/elzr/vim-json.git

echo "Compile YouCompleteMe"
cd YouCompleteMe
git submodule update --init --recursive
python install.py
