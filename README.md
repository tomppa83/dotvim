Installation:

    git clone git@github.com:tomppa83/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Initialize and update registered submodules after clone:

    cd ~/.vim
    git submodule init
    git submodule update

To upgrade all submodules:

git 1.8.2 -> (the option --remote was added to support updating to latest tips of remote branches)

    git submodule update --recursive --remote

git 1.6.1 ->

    git submodule foreach git pull origin master

Installed plugins:

- https://github.com/tpope/vim-pathogen
- https://github.com/itchyny/lightline.vim
- https://github.com/vim-scripts/mru.vim
- https://github.com/vim-syntastic/syntastic
- https://github.com/mfukar/robotframework-vim
- https://github.com/tpope/vim-fugitive
- https://github.com/airblade/vim-gitgutter
